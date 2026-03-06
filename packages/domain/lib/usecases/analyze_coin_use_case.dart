import 'package:domain/entities/ai_insight_entity.dart';
import 'package:domain/entities/coin_ticker_entity.dart';
import 'package:domain/entities/chart_data_entity.dart';
import 'package:domain/repositories/ai_repository.dart';

/// UseCase for AI-powered coin analysis
abstract interface class AnalyzeCoinUseCase {
  Future<AiInsightEntity> execute({
    required CoinTickerEntity ticker,
    ChartDataEntity? chartData,
    List<NewsArticleEntity>? news,
  });
}

class AnalyzeCoinUseCaseImpl implements AnalyzeCoinUseCase {
  final AiRepository repository;

  AnalyzeCoinUseCaseImpl({required this.repository});

  @override
  Future<AiInsightEntity> execute({
    required CoinTickerEntity ticker,
    ChartDataEntity? chartData,
    List<NewsArticleEntity>? news,
  }) {
    return repository.analyzeCoin(
      ticker: ticker,
      chartData: chartData,
      news: news,
    );
  }
}
