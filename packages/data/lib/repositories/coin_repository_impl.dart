import 'package:domain/domain.dart';
import 'package:data/datasources/binance_rest_data_source.dart';
import 'package:data/datasources/binance_websocket_data_source.dart';

class CoinRepositoryImpl implements CoinRepository {
  final BinanceRestDataSource restDataSource;
  final BinanceWebSocketDataSource wsDataSource;

  CoinRepositoryImpl({
    required this.restDataSource,
    required this.wsDataSource,
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
  Stream<CoinTickerEntity> subscribeToTicker(String symbol) {
    return wsDataSource.subscribeAllTickers().map((tickers) {
      final ticker = tickers.firstWhere(
        (t) => t.symbol == symbol,
        orElse: () => throw Exception('Ticker not found: $symbol'),
      );
      return ticker.toEntity();
    });
  }

  @override
  Stream<List<CoinTickerEntity>> subscribeToTickers(List<String> symbols) {
    // All Market Tickers Stream을 구독하고 필터링
    return wsDataSource.subscribeAllTickers().map((tickers) {
      // USDT 페어만 필터링 (더 적은 데이터로 성능 최적화)
      final usdtTickers = tickers
          .where((t) => t.symbol.endsWith('USDT'))
          .map((dto) => dto.toEntity())
          .toList();

      return usdtTickers;
    });
  }
}
