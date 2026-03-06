import 'package:domain/entities/ai_insight_entity.dart';
import 'package:domain/entities/coin_ticker_entity.dart';
import 'package:domain/entities/chart_data_entity.dart';

/// AI analysis repository interface
abstract interface class AiRepository {
  Future<bool> isAvailable();
  String? get unavailableReason;
  Future<AiInsightEntity> analyzeCoin({
    required CoinTickerEntity ticker,
    ChartDataEntity? chartData,
    List<NewsArticleEntity>? news,
  });
}
