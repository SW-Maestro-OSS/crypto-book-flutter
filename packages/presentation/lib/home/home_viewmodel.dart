import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/home/home_state.dart';
import 'package:presentation/home/home_intent.dart';
import 'package:presentation/home/home_side_effect.dart';
import 'package:presentation/core/mvi/side_effect_mixin.dart';
import 'package:presentation/core/mvi/websocket_subscription_mixin.dart';
import 'package:presentation/providers/usecase_providers.dart';

part 'home_viewmodel.g.dart';

/// Home ViewModel with SideEffect + WebSocket subscription support
@riverpod
class HomeViewModel extends _$HomeViewModel
    with SideEffectMixin<HomeSideEffect>, WebSocketSubscriptionMixin {
  StreamSubscription? _tickerSubscription;

  @override
  HomeState build() {
    final wsRepo = ref.read(webSocketRepositoryProvider);
    subscribeWebSocket(wsRepo.connectionState);

    ref.onDispose(() {
      _tickerSubscription?.cancel();
      disposeWebSocketSubscription();
      disposeSideEffects();
    });

    return const HomeState.initial();
  }

  @override
  void onWsDisconnected() {
    emitSideEffect(
        const HomeSideEffect.showToast('실시간 연결이 끊어졌습니다. 재연결 중...'));
  }

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
      final useCase = ref.read(subscribeCoinTickerUseCaseProvider);
      final tickerStream = useCase.execute([]);

      _tickerSubscription = tickerStream.listen(
        (tickers) {
          final sortedTickers = List<CoinTickerEntity>.from(tickers);
          sortedTickers
              .sort((a, b) => b.quoteVolume24h.compareTo(a.quoteVolume24h));
          final top30 = sortedTickers.take(30).toList();

          onIntent(HomeIntent.tickerUpdated(top30));
        },
        onError: (error) {
          final appError = error is AppError
              ? error
              : GenericNetworkError(error.toString());
          state = HomeState.error(appError);
          emitSideEffect(HomeSideEffect.showError(appError.userMessage));
        },
      );
    } catch (e) {
      final appError = e is AppError
          ? e
          : GenericNetworkError(e.toString());
      state = HomeState.error(appError);
      emitSideEffect(HomeSideEffect.showError(appError.userMessage));
    }
  }

  Future<void> _handleRefresh() async {
    await _tickerSubscription?.cancel();
    await _handleLoad();
  }

  void _handleSort(SortType sortType) {
    state.whenOrNull(
      loaded: (allTickers, _, displayCount, currentSortType, isAscending, searchQuery) {
        final newIsAscending = sortType == currentSortType ? !isAscending : false;

        final filtered = searchQuery.isEmpty
            ? allTickers
            : allTickers.where((ticker) {
                final symbol = ticker.symbol.toLowerCase();
                return symbol.contains(searchQuery.toLowerCase());
              }).toList();

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
        final filtered = query.isEmpty
            ? allTickers
            : allTickers.where((ticker) {
                final symbol = ticker.symbol.toLowerCase();
                final searchLower = query.toLowerCase();
                return symbol.contains(searchLower);
              }).toList();

        final sorted = _sortTickers(filtered, sortType, isAscending);
        final displayed = sorted.take(displayCount).toList();

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

    final filtered = currentSearchQuery.isEmpty
        ? tickers
        : tickers.where((ticker) {
            final symbol = ticker.symbol.toLowerCase();
            return symbol.contains(currentSearchQuery.toLowerCase());
          }).toList();

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

        final filtered = searchQuery.isEmpty
            ? allTickers
            : allTickers.where((ticker) {
                final symbol = ticker.symbol.toLowerCase();
                return symbol.contains(searchQuery.toLowerCase());
              }).toList();

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
