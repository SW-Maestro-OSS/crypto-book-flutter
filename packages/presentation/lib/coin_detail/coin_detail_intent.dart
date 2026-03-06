import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'coin_detail_intent.freezed.dart';

/// Coin Detail intents (user actions + internal events)
@freezed
sealed class CoinDetailIntent with _$CoinDetailIntent {
  const factory CoinDetailIntent.load(String symbol) = _Load;
  const factory CoinDetailIntent.tickerUpdated(CoinTickerEntity ticker) = _TickerUpdated;
  const factory CoinDetailIntent.changeTimeframe(ChartTimeframe timeframe) = _ChangeTimeframe;
  const factory CoinDetailIntent.loadNews(String symbol) = _LoadNews;
  const factory CoinDetailIntent.newsLoaded(List<NewsArticleEntity> articles) = _NewsLoaded;
  const factory CoinDetailIntent.requestAiAnalysis() = _RequestAiAnalysis;
  const factory CoinDetailIntent.aiAnalysisCompleted(AiInsightEntity insight) = _AiAnalysisCompleted;
  const factory CoinDetailIntent.aiAnalysisFailed(String error) = _AiAnalysisFailed;
}
