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
      final tickerStream = useCase.execute([]);  // 빈 배열 = 모든 USDT 페어

      _tickerSubscription = tickerStream.listen(
        (tickers) {
          print('[ViewModel] Received ${tickers.length} tickers from UseCase');

          // quoteVolume 기준 내림차순 정렬 후 상위 30개
          final sortedTickers = List<CoinTickerEntity>.from(tickers);
          sortedTickers.sort((a, b) => b.quoteVolume24h.compareTo(a.quoteVolume24h));
          final top30 = sortedTickers.take(30).toList();

          print('[ViewModel] Top 30 by quoteVolume: ${top30.length} tickers');

          // 현재 State에서 정렬 설정 가져오기 (유지)
          final currentDisplayCount = state.maybeWhen(
            loaded: (_, __, displayCount, ___, ____) => displayCount,
            orElse: () => 10,
          );
          final currentSortType = state.maybeWhen(
            loaded: (_, __, ___, sortType, ____) => sortType,
            orElse: () => SortType.none,
          );
          final currentIsAscending = state.maybeWhen(
            loaded: (_, __, ___, ____, isAscending) => isAscending,
            orElse: () => false,
          );

          // 현재 정렬 적용
          final sortedForDisplay = _sortTickers(top30, currentSortType, currentIsAscending);
          final displayed = sortedForDisplay.take(currentDisplayCount).toList();

          state = HomeState.loaded(
            allTickers: top30,
            displayedTickers: displayed,
            displayCount: currentDisplayCount,
            sortType: currentSortType,
            isAscending: currentIsAscending,
          );
        },
        onError: (error) {
          state = HomeState.error('실시간 데이터 수신 실패: $error');
        },
      );
    } catch (e) {
      state = HomeState.error('데이터 로드 실패: $e');
    }
  }

  Future<void> _handleRefresh() async {
    // 기존 구독 취소 후 재시작
    await _tickerSubscription?.cancel();
    await _handleLoad();
  }

  void _handleSort(SortType sortType) {
    state.whenOrNull(
      loaded: (allTickers, displayedTickers, displayCount, _, isAscending) {
        final sorted = _sortTickers(displayedTickers, sortType, isAscending);
        state = HomeState.loaded(
          allTickers: allTickers,
          displayedTickers: sorted,
          displayCount: displayCount,
          sortType: sortType,
          isAscending: isAscending,
        );
      },
    );
  }

  void _handleToggleSortOrder() {
    state.whenOrNull(
      loaded: (allTickers, displayedTickers, displayCount, sortType, isAscending) {
        final newOrder = !isAscending;
        final sorted = _sortTickers(displayedTickers, sortType, newOrder);
        state = HomeState.loaded(
          allTickers: allTickers,
          displayedTickers: sorted,
          displayCount: displayCount,
          sortType: sortType,
          isAscending: newOrder,
        );
      },
    );
  }

  void _handleSearch(String query) {
    // TODO: 검색 구현
  }

  void _handleTickerUpdated(List<CoinTickerEntity> tickers) {
    state.whenOrNull(
      loaded: (_, displayedTickers, displayCount, sortType, isAscending) {
        state = HomeState.loaded(
          allTickers: tickers,
          displayedTickers: displayedTickers,
          displayCount: displayCount,
          sortType: sortType,
          isAscending: isAscending,
        );
      },
    );
  }

  void _handleLoadMore() {
    state.whenOrNull(
      loaded: (allTickers, displayedTickers, displayCount, sortType, isAscending) {
        if (displayCount >= 30) return;

        final newCount = (displayCount + 10).clamp(0, 30);
        final newDisplayed = allTickers.take(newCount).toList();

        state = HomeState.loaded(
          allTickers: allTickers,
          displayedTickers: newDisplayed,
          displayCount: newCount,
          sortType: sortType,
          isAscending: isAscending,
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
