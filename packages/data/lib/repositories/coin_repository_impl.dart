import 'package:domain/domain.dart';
import 'package:data/datasources/binance_rest_data_source.dart';
import 'package:data/datasources/binance_websocket_data_source.dart';
import 'package:data/datasources/ticker_cache_data_source.dart';

class CoinRepositoryImpl implements CoinRepository {
  final BinanceRestDataSource restDataSource;
  final BinanceWebSocketDataSource wsDataSource;
  final TickerCacheDataSource tickerCache;

  CoinRepositoryImpl({
    required this.restDataSource,
    required this.wsDataSource,
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
  Stream<List<CoinTickerEntity>> subscribeToTickers(List<String> symbols) async* {
    // STEP 1: Emit cached data immediately (before WebSocket connects)
    final cachedTickers = tickerCache.getAll();
    if (cachedTickers.isNotEmpty) {
      final usdtTickers = cachedTickers
          .where((t) => t.symbol.endsWith('USDT'))
          .map((dto) => dto.toEntity())
          .toList();
      yield usdtTickers;
    }

    // STEP 2: Subscribe to WebSocket and merge with cache
    await for (final incomingTickers in wsDataSource.subscribeAllTickers()) {
      print('[Repository] WebSocket received ${incomingTickers.length} tickers');

      // STEP 3: Update cache (merge: update changed, add new, preserve unchanged)
      await tickerCache.updateMany(incomingTickers);

      // STEP 4: Get all cached tickers (merged result)
      final allTickers = tickerCache.getAll();
      print('[Repository] Total cached: ${allTickers.length} tickers');

      // STEP 5: Filter USDT pairs and convert to entities
      final usdtTickers = allTickers
          .where((t) => t.symbol.endsWith('USDT'))
          .map((dto) => dto.toEntity())
          .toList();

      print('[Repository] USDT filtered: ${usdtTickers.length} tickers');

      // STEP 6: Emit merged result
      yield usdtTickers;
    }
  }
}
