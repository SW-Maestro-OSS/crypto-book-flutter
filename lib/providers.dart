import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';

part 'providers.g.dart';

// ==================== Data Layer ====================

@riverpod
TickerCacheDataSource tickerCacheDataSource(Ref ref) {
  final cache = TickerCacheDataSource();
  // Initialize asynchronously
  cache.init();
  return cache;
}

@riverpod
BinanceRestDataSource binanceRestDataSource(Ref ref) {
  return BinanceRestDataSource(
    baseUrl: BinanceConstants.restApiBaseUrl,
  );
}

@riverpod
BinanceWebSocketClient binanceWebSocketClient(Ref ref) {
  return BinanceWebSocketClient(
    baseUrl: BinanceConstants.wsBaseUrl,
  );
}

@riverpod
BinanceWebSocketDataSource binanceWebSocketDataSource(Ref ref) {
  return BinanceWebSocketDataSource(
    client: ref.watch(binanceWebSocketClientProvider),
  );
}

@riverpod
CoinRepository coinRepository(Ref ref) {
  return CoinRepositoryImpl(
    restDataSource: ref.watch(binanceRestDataSourceProvider),
    wsDataSource: ref.watch(binanceWebSocketDataSourceProvider),
    tickerCache: ref.watch(tickerCacheDataSourceProvider),
  );
}

@riverpod
ExchangeRateDataSource exchangeRateDataSource(Ref ref) {
  return ExchangeRateDataSource();
}

@riverpod
ExchangeRateRepository exchangeRateRepository(Ref ref) {
  return ExchangeRateRepositoryImpl(
    dataSource: ref.watch(exchangeRateDataSourceProvider),
  );
}

// ==================== Domain Layer ====================

@riverpod
GetCoinListUseCase getCoinListUseCase(Ref ref) {
  return GetCoinListUseCaseImpl(
    repository: ref.watch(coinRepositoryProvider),
  );
}

@riverpod
SubscribeCoinTickerUseCase subscribeCoinTickerUseCase(Ref ref) {
  return SubscribeCoinTickerUseCaseImpl(
    repository: ref.watch(coinRepositoryProvider),
  );
}
