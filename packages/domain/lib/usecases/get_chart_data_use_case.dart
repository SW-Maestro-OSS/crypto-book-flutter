import 'package:domain/repositories/coin_repository.dart';
import 'package:domain/entities/chart_data_entity.dart';

/// Use Case for fetching chart data
abstract interface class GetChartDataUseCase {
  Future<ChartDataEntity> execute(String symbol, ChartTimeframe timeframe);
}

class GetChartDataUseCaseImpl implements GetChartDataUseCase {
  final CoinRepository repository;

  GetChartDataUseCaseImpl({required this.repository});

  @override
  Future<ChartDataEntity> execute(String symbol, ChartTimeframe timeframe) {
    return repository.getChartData(symbol, timeframe);
  }
}
