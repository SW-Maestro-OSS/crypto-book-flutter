import 'package:domain/domain.dart';
import 'package:data/datasources/binance_rest_data_source.dart';
import 'package:data/datasources/ws_data_hub.dart';
import 'package:data/datasources/ticker_cache_data_source.dart';
import 'package:data/dto/kline_dto.dart';

class CoinRepositoryImpl implements CoinRepository {
  final BinanceRestDataSource restDataSource;
  final WSDataHub wsDataHub;
  final TickerCacheDataSource tickerCache;

  CoinRepositoryImpl({
    required this.restDataSource,
    required this.wsDataHub,
    required this.tickerCache,
  });

  @override
  Future<List<CoinEntity>> getCoinList() async {
    final dtos = await restDataSource.getCoinList();
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<CoinTickerEntity>> getTickers(List<String> symbols) async {
    // WebSocket 스트림에서 첫 번째 데이터만 가져옴
    final stream = subscribeToTickers(symbols);
    return await stream.first;
  }

  @override
  Stream<CoinTickerEntity> subscribeToTicker(String symbol) async* {
    await for (final tickerDto in wsDataHub.getSymbolStream(symbol)) {
      yield tickerDto.toEntity();
    }
  }

  @override
  Stream<List<CoinTickerEntity>> subscribeToTickers(List<String> symbols) async* {
    // Stream all symbols from WSDataHub (cache already loaded in provider)
    await for (final symbolMap in wsDataHub.getAllSymbolsStream()) {
      print('[Repository] Received ${symbolMap.length} tickers from WSDataHub');

      // Update cache
      await tickerCache.updateMany(symbolMap.values.toList());

      // Filter USDT pairs and convert to entities
      final entities = symbolMap.values
          .map((dto) => dto.toEntity())
          .toList();

      final usdtPairs = entities
          .where((e) => e.quoteAsset == 'USDT')
          .toList();

      print('[Repository] Filtered ${usdtPairs.length} USDT pairs');

      // Emit filtered result
      yield usdtPairs;
    }
  }

  @override
  Future<ChartDataEntity> getChartData(
    String symbol,
    ChartTimeframe timeframe,
  ) async {
    try {
      // Fetch klines from Binance API
      final klines = await restDataSource.fetchKlines(
        symbol: symbol,
        interval: timeframe.interval,
        limit: timeframe.dataPointCount,
      );

      // Convert to ChartDataPoint list
      final dataPoints = klines
          .map((klineData) => KlineDTO.fromList(klineData).toChartDataPoint())
          .toList();

      return ChartDataEntity(
        dataPoints: dataPoints,
        timeframe: timeframe,
      );
    } catch (e) {
      throw GenericNetworkError('Failed to fetch chart data: $e');
    }
  }
}
