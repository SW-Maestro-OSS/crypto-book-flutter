import 'package:domain/domain.dart';
import 'package:data/datasources/ai_data_source.dart';

class AiRepositoryImpl implements AiRepository {
  final AiDataSource dataSource;

  AiRepositoryImpl({required this.dataSource});

  @override
  Future<bool> isAvailable() async {
    await dataSource.ensureInitialized();
    return dataSource.isAvailable;
  }

  @override
  String? get unavailableReason => dataSource.unavailableReason;

  @override
  Future<AiInsightEntity> analyzeCoin({
    required CoinTickerEntity ticker,
    ChartDataEntity? chartData,
    List<NewsArticleEntity>? news,
  }) {
    return dataSource.analyzeCoin(
      ticker: ticker,
      chartData: chartData,
      news: news,
    );
  }
}
