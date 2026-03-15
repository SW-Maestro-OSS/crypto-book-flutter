import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/coin_detail/coin_detail_state.dart';
import 'package:presentation/coin_detail/coin_detail_intent.dart';
import 'package:presentation/coin_detail/coin_detail_side_effect.dart';
import 'package:presentation/core/mvi/side_effect_mixin.dart';
import 'package:presentation/core/mvi/websocket_subscription_mixin.dart';
import 'package:presentation/providers/app_settings_provider.dart';
import 'package:presentation/providers/usecase_providers.dart';

part 'coin_detail_viewmodel.g.dart';

/// Coin Detail ViewModel with SideEffect + WebSocket subscription support
@riverpod
class CoinDetailViewModel extends _$CoinDetailViewModel
    with SideEffectMixin<CoinDetailSideEffect>, WebSocketSubscriptionMixin {
  StreamSubscription? _tickerSubscription;
  Timer? _chartRefreshTimer;

  @override
  CoinDetailState build(String symbol) {
    final wsRepo = ref.read(webSocketRepositoryProvider);
    subscribeWebSocket(wsRepo.connectionState);

    ref.onDispose(() {
      _tickerSubscription?.cancel();
      _chartRefreshTimer?.cancel();
      disposeWebSocketSubscription();
      disposeSideEffects();
    });

    Future.microtask(() => onIntent(CoinDetailIntent.load(symbol)));

    return const CoinDetailState.initial();
  }

  @override
  void onWsDisconnected() {
    emitSideEffect(const CoinDetailSideEffect.showToast(
        '실시간 연결이 끊어졌습니다. 재연결 중...'));
  }

  void onIntent(CoinDetailIntent intent) {
    intent.when(
      load: _handleLoad,
      tickerUpdated: _handleTickerUpdated,
      changeTimeframe: _handleChangeTimeframe,
      loadNews: _handleLoadNews,
      newsLoaded: _handleNewsLoaded,
      requestAiAnalysis: _handleRequestAiAnalysis,
      aiAnalysisCompleted: _handleAiAnalysisCompleted,
      aiAnalysisFailed: _handleAiAnalysisFailed,
    );
  }

  Future<void> _handleLoad(String symbol) async {
    state = const CoinDetailState.loading();

    try {
      final useCase = ref.read(subscribeSingleTickerUseCaseProvider);
      final tickerStream = useCase.execute(symbol);

      _tickerSubscription = tickerStream.listen(
        (ticker) {
          onIntent(CoinDetailIntent.tickerUpdated(ticker));
        },
        onError: (error) {
          final appError = error is AppError
              ? error
              : GenericNetworkError(error.toString());
          state = CoinDetailState.error(appError);
          emitSideEffect(
            CoinDetailSideEffect.showError(appError.userMessage),
          );
        },
      );

      _loadChartData(symbol, ChartTimeframe.h24);

      // Load news
      _handleLoadNews(symbol);

      // Periodic chart refresh every 60 seconds
      _chartRefreshTimer = Timer.periodic(
        const Duration(seconds: 60),
        (_) {
          state.maybeMap(
            loaded: (s) => _loadChartData(symbol, s.selectedTimeframe),
            orElse: () {},
          );
        },
      );
    } catch (e) {
      final appError =
          e is AppError ? e : GenericNetworkError(e.toString());
      state = CoinDetailState.error(appError);
      emitSideEffect(
        CoinDetailSideEffect.showError(appError.userMessage),
      );
    }
  }

  void _handleTickerUpdated(CoinTickerEntity ticker) {
    state.maybeMap(
      loaded: (currentState) {
        state = currentState.copyWith(ticker: ticker);
      },
      orElse: () {
        state = CoinDetailState.loaded(ticker: ticker);
      },
    );
  }

  Future<void> _handleChangeTimeframe(ChartTimeframe timeframe) async {
    state.maybeMap(
      loaded: (currentState) async {
        state = currentState.copyWith(
          chartData: null,
          selectedTimeframe: timeframe,
          isLoadingChart: true,
        );
        await _loadChartData(currentState.ticker.symbol, timeframe);
      },
      orElse: () {},
    );
  }

  Future<void> _handleLoadNews(String symbol) async {
    try {
      final newsUseCase = ref.read(getNewsUseCaseProvider);
      state.maybeMap(
        loaded: (currentState) {
          state = currentState.copyWith(isLoadingNews: true);
        },
        orElse: () {},
      );

      final baseAsset = CoinTickerEntity.extractBaseAsset(symbol);
      final articles = await newsUseCase.execute(baseAsset);
      onIntent(CoinDetailIntent.newsLoaded(articles));
    } catch (e) {
      debugPrint('[CoinDetailViewModel] Failed to load news: $e');
      emitSideEffect(
        const CoinDetailSideEffect.showToast('Failed to load news'),
      );
      state.maybeMap(
        loaded: (currentState) {
          state = currentState.copyWith(isLoadingNews: false);
        },
        orElse: () {},
      );
    }
  }

  void _handleNewsLoaded(List<NewsArticleEntity> articles) {
    state.maybeMap(
      loaded: (currentState) {
        state = currentState.copyWith(
          articles: articles,
          isLoadingNews: false,
        );
      },
      orElse: () {},
    );
  }

  Future<void> _handleRequestAiAnalysis() async {
    try {
      final aiUseCase = ref.read(analyzeCoinUseCaseProvider);

      state.maybeMap(
        loaded: (currentState) async {
          final aiRepo = ref.read(aiRepositoryProvider);
          final isAvailable = await aiRepo.isAvailable();
          if (!isAvailable) {
            final reason = aiRepo.unavailableReason ??
                'AI analysis is not available on this device';
            state = currentState.copyWith(
              aiStatus: AiAnalysisStatus.unavailable,
            );
            emitSideEffect(
              CoinDetailSideEffect.showToast(reason),
            );
            return;
          }

          state = currentState.copyWith(
            aiStatus: AiAnalysisStatus.loading,
          );

          try {
            final language = ref.read(appSettingsProvider).language;
            final insight = await aiUseCase.execute(
              ticker: currentState.ticker,
              chartData: currentState.chartData,
              news: currentState.articles,
              languageCode: language,
            );
            onIntent(CoinDetailIntent.aiAnalysisCompleted(insight));
          } catch (e) {
            onIntent(CoinDetailIntent.aiAnalysisFailed(e.toString()));
          }
        },
        orElse: () {},
      );
    } catch (e) {
      debugPrint('[CoinDetailViewModel] AI analysis error: $e');
      onIntent(CoinDetailIntent.aiAnalysisFailed(e.toString()));
    }
  }

  void _handleAiAnalysisCompleted(AiInsightEntity insight) {
    state.maybeMap(
      loaded: (currentState) {
        state = currentState.copyWith(
          aiInsight: insight,
          aiStatus: AiAnalysisStatus.completed,
        );
      },
      orElse: () {},
    );
  }

  void _handleAiAnalysisFailed(String error) {
    state.maybeMap(
      loaded: (currentState) {
        state = currentState.copyWith(
          aiStatus: AiAnalysisStatus.error,
        );
      },
      orElse: () {},
    );
    emitSideEffect(CoinDetailSideEffect.showError('AI analysis failed: $error'));
  }

  Future<void> _loadChartData(String symbol, ChartTimeframe timeframe) async {
    try {
      final chartUseCase = ref.read(getChartDataUseCaseProvider);
      final chartData = await chartUseCase.execute(symbol, timeframe);

      state.maybeMap(
        loaded: (currentState) {
          state = currentState.copyWith(
            chartData: chartData,
            selectedTimeframe: timeframe,
            isLoadingChart: false,
          );
        },
        orElse: () {},
      );
    } catch (e) {
      debugPrint('[CoinDetailViewModel] Failed to load chart: $e');
      state.maybeMap(
        loaded: (currentState) {
          state = currentState.copyWith(
            chartData: null,
            isLoadingChart: false,
          );
        },
        orElse: () {},
      );
    }
  }
}
