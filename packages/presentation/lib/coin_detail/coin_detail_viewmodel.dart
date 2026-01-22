import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/coin_detail/coin_detail_state.dart';
import 'package:presentation/coin_detail/coin_detail_intent.dart';
import 'package:presentation/providers/usecase_providers.dart';

part 'coin_detail_viewmodel.g.dart';

/// Coin Detail 화면의 ViewModel (비즈니스 로직)
@riverpod
class CoinDetailViewModel extends _$CoinDetailViewModel {
  StreamSubscription? _tickerSubscription;

  @override
  CoinDetailState build(String symbol) {
    // Cleanup on dispose
    ref.onDispose(() {
      _tickerSubscription?.cancel();
    });

    // Auto-load on init
    Future.microtask(() => onIntent(CoinDetailIntent.load(symbol)));

    return const CoinDetailState.initial();
  }

  /// Intent 처리
  void onIntent(CoinDetailIntent intent) {
    intent.when(
      load: _handleLoad,
      tickerUpdated: _handleTickerUpdated,
      changeTimeframe: _handleChangeTimeframe,
    );
  }

  Future<void> _handleLoad(String symbol) async {
    state = const CoinDetailState.loading();

    try {
      // Subscribe to WebSocket ticker stream for this specific symbol
      final useCase = ref.read(subscribeCoinTickerUseCaseProvider);

      // Use subscribeToTickers with single symbol to get stream
      final tickerStream = useCase.execute([symbol]);

      _tickerSubscription = tickerStream.listen(
        (tickers) {
          if (tickers.isNotEmpty) {
            final ticker = tickers.firstWhere(
              (t) => t.symbol == symbol,
              orElse: () => tickers.first,
            );

            // ✅ MVI 패턴: Intent를 통해 상태 변경
            onIntent(CoinDetailIntent.tickerUpdated(ticker));
          }
        },
        onError: (error) {
          final appError = error is AppError
              ? error
              : GenericNetworkError(error.toString());
          state = CoinDetailState.error(appError);
        },
      );

      // Load initial chart data in background
      _loadChartData(symbol, ChartTimeframe.h24);
    } catch (e) {
      final appError = e is AppError
          ? e
          : GenericNetworkError(e.toString());
      state = CoinDetailState.error(appError);
    }
  }

  void _handleTickerUpdated(CoinTickerEntity ticker) {
    // Preserve existing chart data and timeframe when updating ticker
    state.maybeMap(
      loaded: (currentState) {
        state = CoinDetailState.loaded(
          ticker: ticker,
          chartData: currentState.chartData,
          selectedTimeframe: currentState.selectedTimeframe,
          isLoadingChart: currentState.isLoadingChart,
        );
      },
      orElse: () {
        // First time loading
        state = CoinDetailState.loaded(ticker: ticker);
      },
    );
  }

  Future<void> _handleChangeTimeframe(ChartTimeframe timeframe) async {
    state.maybeMap(
      loaded: (currentState) async {
        // Set loading state for chart
        state = CoinDetailState.loaded(
          ticker: currentState.ticker,
          chartData: null,
          selectedTimeframe: timeframe,
          isLoadingChart: true,
        );

        // Load chart data for new timeframe
        await _loadChartData(currentState.ticker.symbol, timeframe);
      },
      orElse: () {},
    );
  }

  Future<void> _loadChartData(String symbol, ChartTimeframe timeframe) async {
    try {
      final chartUseCase = ref.read(getChartDataUseCaseProvider);
      final chartData = await chartUseCase.execute(symbol, timeframe);

      // Update state with chart data
      state.maybeMap(
        loaded: (currentState) {
          state = CoinDetailState.loaded(
            ticker: currentState.ticker,
            chartData: chartData,
            selectedTimeframe: timeframe,
            isLoadingChart: false,
          );
        },
        orElse: () {},
      );
    } catch (e) {
      // Chart loading failed, but keep showing ticker data
      print('[CoinDetailViewModel] Failed to load chart: $e');
      state.maybeMap(
        loaded: (currentState) {
          state = CoinDetailState.loaded(
            ticker: currentState.ticker,
            chartData: null,
            selectedTimeframe: currentState.selectedTimeframe,
            isLoadingChart: false,
          );
        },
        orElse: () {},
      );
    }
  }
}
