import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/home/home_state.dart';
import 'package:presentation/home/home_intent.dart';
import 'package:presentation/providers/usecase_providers.dart';

part 'home_viewmodel.g.dart';

/// Home 화면의 ViewModel (비즈니스 로직)
@riverpod
class HomeViewModel extends _$HomeViewModel {
  StreamSubscription? _tickerSubscription;

  @override
  HomeState build() {
    // ViewModel이 dispose될 때 구독 해제
    ref.onDispose(() {
      _tickerSubscription?.cancel();
    });

    return const HomeState.initial();
  }

  /// Intent 처리
  void onIntent(HomeIntent intent) {
    intent.when(
      load: _handleLoad,
      refresh: _handleRefresh,
      sort: _handleSort,
      toggleSortOrder: _handleToggleSortOrder,
      search: _handleSearch,
      tickerUpdated: _handleTickerUpdated,
      loadMore: _handleLoadMore,
    );
  }

  Future<void> _handleLoad() async {
    state = const HomeState.loading();

    try {
      // WebSocket으로 실시간 티커 구독
      final useCase = ref.read(subscribeCoinTickerUseCaseProvider);
      final tickerStream = useCase.execute([]); // 빈 배열 = 모든 USDT 페어

      _tickerSubscription = tickerStream.listen(
        (tickers) {
          print('[ViewModel] Received ${tickers.length} tickers from UseCase');

          // quoteVolume 기준 내림차순 정렬 후 상위 30개
          final sortedTickers = List<CoinTickerEntity>.from(tickers);
          sortedTickers
              .sort((a, b) => b.quoteVolume24h.compareTo(a.quoteVolume24h));
          final top30 = sortedTickers.take(30).toList();

          print('[ViewModel] Top 30 by quoteVolume: ${top30.length} tickers');

          // ✅ MVI 패턴: Intent를 통해 상태 변경
          onIntent(HomeIntent.tickerUpdated(top30));
        },
        onError: (error) {
          final appError = error is AppError
              ? error
              : GenericNetworkError(error.toString());
          state = HomeState.error(appError);
        },
      );
    } catch (e) {
      final appError = e is AppError
          ? e
          : GenericNetworkError(e.toString());
      state = HomeState.error(appError);
    }
  }

  Future<void> _handleRefresh() async {
    // 기존 구독 취소 후 재시작
    await _tickerSubscription?.cancel();
    await _handleLoad();
  }

  void _handleSort(SortType sortType) {
    state.whenOrNull(
      loaded: (allTickers, _, displayCount, currentSortType, isAscending, searchQuery) {
        // Toggle sort order if clicking same column
        final newIsAscending = sortType == currentSortType ? !isAscending : false;

        // Apply search filter
        final filtered = searchQuery.isEmpty
            ? allTickers
            : allTickers.where((ticker) {
                final symbol = ticker.symbol.toLowerCase();
                return symbol.contains(searchQuery.toLowerCase());
              }).toList();

        // Apply sorting
        final sorted = _sortTickers(filtered, sortType, newIsAscending);
        final displayed = sorted.take(displayCount).toList();

        state = HomeState.loaded(
          allTickers: allTickers,
          displayedTickers: displayed,
          displayCount: displayCount,
          sortType: sortType,
          isAscending: newIsAscending,
          searchQuery: searchQuery,
        );
      },
    );
  }

  void _handleToggleSortOrder() {
    state.whenOrNull(
      loaded: (allTickers, _, displayCount, sortType, isAscending, searchQuery) {
        final newOrder = !isAscending;

        // Apply search filter
        final filtered = searchQuery.isEmpty
            ? allTickers
            : allTickers.where((ticker) {
                final symbol = ticker.symbol.toLowerCase();
                return symbol.contains(searchQuery.toLowerCase());
              }).toList();

        final sorted = _sortTickers(filtered, sortType, newOrder);
        final displayed = sorted.take(displayCount).toList();

        state = HomeState.loaded(
          allTickers: allTickers,
          displayedTickers: displayed,
          displayCount: displayCount,
          sortType: sortType,
          isAscending: newOrder,
          searchQuery: searchQuery,
        );
      },
    );
  }

  void _handleSearch(String query) {
    state.whenOrNull(
      loaded: (allTickers, _, displayCount, sortType, isAscending, __) {
        // 1. Filter tickers based on search query
        final filtered = query.isEmpty
            ? allTickers
            : allTickers.where((ticker) {
                final symbol = ticker.symbol.toLowerCase();
                final searchLower = query.toLowerCase();
                return symbol.contains(searchLower);
              }).toList();

        // 2. Apply sorting to filtered results
        final sorted = _sortTickers(filtered, sortType, isAscending);

        // 3. Apply displayCount limit
        final displayed = sorted.take(displayCount).toList();

        // 4. Update state with search query
        state = HomeState.loaded(
          allTickers: allTickers,
          displayedTickers: displayed,
          displayCount: displayCount,
          sortType: sortType,
          isAscending: isAscending,
          searchQuery: query,
        );
      },
    );
  }

  void _handleTickerUpdated(List<CoinTickerEntity> tickers) {
    // Get current settings or use defaults
    final currentDisplayCount = state.maybeWhen(
      loaded: (_, __, displayCount, ___, ____, _____) => displayCount,
      orElse: () => 20,
    );
    final currentSortType = state.maybeWhen(
      loaded: (_, __, ___, sortType, ____, _____) => sortType,
      orElse: () => SortType.none,
    );
    final currentIsAscending = state.maybeWhen(
      loaded: (_, __, ___, ____, isAscending, _____) => isAscending,
      orElse: () => false,
    );
    final currentSearchQuery = state.maybeWhen(
      loaded: (_, __, ___, ____, _____, searchQuery) => searchQuery,
      orElse: () => '',
    );

    // Apply search filter
    final filtered = currentSearchQuery.isEmpty
        ? tickers
        : tickers.where((ticker) {
            final symbol = ticker.symbol.toLowerCase();
            return symbol.contains(currentSearchQuery.toLowerCase());
          }).toList();

    // Apply sorting
    final sorted = _sortTickers(filtered, currentSortType, currentIsAscending);
    final displayed = sorted.take(currentDisplayCount).toList();

    state = HomeState.loaded(
      allTickers: tickers,
      displayedTickers: displayed,
      displayCount: currentDisplayCount,
      sortType: currentSortType,
      isAscending: currentIsAscending,
      searchQuery: currentSearchQuery,
    );
  }

  void _handleLoadMore() {
    state.whenOrNull(
      loaded: (allTickers, _, displayCount, sortType, isAscending, searchQuery) {
        if (displayCount >= 30) return;

        final newCount = (displayCount + 10).clamp(0, 30);

        // Apply search filter
        final filtered = searchQuery.isEmpty
            ? allTickers
            : allTickers.where((ticker) {
                final symbol = ticker.symbol.toLowerCase();
                return symbol.contains(searchQuery.toLowerCase());
              }).toList();

        // 정렬을 적용한 후 표시
        final sorted = _sortTickers(filtered, sortType, isAscending);
        final newDisplayed = sorted.take(newCount).toList();

        state = HomeState.loaded(
          allTickers: allTickers,
          displayedTickers: newDisplayed,
          displayCount: newCount,
          sortType: sortType,
          isAscending: isAscending,
          searchQuery: searchQuery,
        );
      },
    );
  }

  // Dart 3: Enhanced enum의 comparator 사용
  List<CoinTickerEntity> _sortTickers(
    List<CoinTickerEntity> tickers,
    SortType sortType,
    bool isAscending,
  ) {
    final sorted = List<CoinTickerEntity>.from(tickers);
    final comparator = sortType.comparator;

    if (comparator != null) {
      sorted.sort(comparator);
    }

    return isAscending ? sorted : sorted.reversed.toList();
  }
}
