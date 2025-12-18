import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/home/home_state.dart';
import 'package:presentation/home/home_intent.dart';
import 'package:presentation/providers/usecase_providers.dart';

part 'home_viewmodel.g.dart';

/// Home 화면의 ViewModel (비즈니스 로직)
@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
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
      // UseCase를 통해 코인 목록 조회
      final useCase = ref.read(getCoinListUseCaseProvider);
      final coins = await useCase.execute();

      // CoinEntity를 CoinTickerEntity로 변환 (임시로 더미 시세 정보)
      final tickers = coins.map((coin) => _coinToTicker(coin)).toList();

      // Volume 기준 내림차순 정렬 후 상위 30개
      tickers.sort((a, b) => b.volume24h.compareTo(a.volume24h));
      final top30 = tickers.take(30).toList();
      final initial10 = top30.take(10).toList();

      state = HomeState.loaded(
        allTickers: top30,
        displayedTickers: initial10,
        displayCount: 10,
      );

      // TODO: WebSocket 구독 시작
      // _subscribeToTickers(coins.map((c) => c.symbol).toList());
    } catch (e) {
      state = HomeState.error('데이터 로드 실패: $e');
    }
  }

  CoinTickerEntity _coinToTicker(CoinEntity coin) {
    return CoinTickerEntity(
      symbol: coin.symbol,
      currentPrice: 0.0,
      priceChange24h: 0.0,
      priceChangePercent24h: 0.0,
      high24h: 0.0,
      low24h: 0.0,
      volume24h: 0.0,
      timestamp: DateTime.now(),
      imageUrl: null,
    );
  }

  Future<void> _handleRefresh() async {
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
