import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';

part 'providers.g.dart';

// ==================== Data Layer ====================

@riverpod
TickerCacheDataSource tickerCacheDataSource(Ref ref) {
  final cache = TickerCacheDataSource();
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

@Riverpod(keepAlive: true)
WSDataHub wsDataHub(Ref ref) {
  final client = ref.watch(binanceWebSocketClientProvider);
  final cache = ref.watch(tickerCacheDataSourceProvider);

  final hub = WSDataHub(client: client);
  hub.loadInitialData(cache.getAll());
  hub.connect();

  ref.onDispose(() => hub.disconnect());
  return hub;
}

@riverpod
CoinRepository coinRepository(Ref ref) {
  return CoinRepositoryImpl(
    restDataSource: ref.watch(binanceRestDataSourceProvider),
    wsDataHub: ref.watch(wsDataHubProvider),
    tickerCache: ref.watch(tickerCacheDataSourceProvider),
  );
}

@riverpod
ExchangeRateDataSource exchangeRateDataSource(Ref ref) {
  return ExchangeRateDataSource();
}

@riverpod
ExchangeRateCacheDataSource exchangeRateCacheDataSource(Ref ref) {
  return ExchangeRateCacheDataSource();
}

@riverpod
ExchangeRateRepository exchangeRateRepository(Ref ref) {
  return ExchangeRateRepositoryImpl(
    dataSource: ref.watch(exchangeRateDataSourceProvider),
    cacheDataSource: ref.watch(exchangeRateCacheDataSourceProvider),
  );
}

@riverpod
SettingsDataSource settingsDataSource(Ref ref) {
  return SettingsDataSource();
}

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  return SettingsRepositoryImpl(
    dataSource: ref.watch(settingsDataSourceProvider),
  );
}

@riverpod
CryptoPanicDataSource cryptoPanicDataSource(Ref ref) {
  return CryptoPanicDataSource();
}

@riverpod
NewsRepository newsRepository(Ref ref) {
  return NewsRepositoryImpl(
    dataSource: ref.watch(cryptoPanicDataSourceProvider),
  );
}

@riverpod
AiDataSource aiDataSource(Ref ref) {
  final ds = AiDataSource();
  ds.initialize();
  return ds;
}

@riverpod
AiRepository aiRepository(Ref ref) {
  return AiRepositoryImpl(
    dataSource: ref.watch(aiDataSourceProvider),
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

@riverpod
SubscribeSingleTickerUseCase subscribeSingleTickerUseCase(Ref ref) {
  return SubscribeSingleTickerUseCaseImpl(
    repository: ref.watch(coinRepositoryProvider),
  );
}

@riverpod
GetSettingsUseCase getSettingsUseCase(Ref ref) {
  return GetSettingsUseCaseImpl(
    repository: ref.watch(settingsRepositoryProvider),
  );
}

@riverpod
SaveSettingsUseCase saveSettingsUseCase(Ref ref) {
  return SaveSettingsUseCaseImpl(
    repository: ref.watch(settingsRepositoryProvider),
  );
}

@riverpod
GetExchangeRateUseCase getExchangeRateUseCase(Ref ref) {
  return GetExchangeRateUseCaseImpl(
    repository: ref.watch(exchangeRateRepositoryProvider),
  );
}

@riverpod
GetChartDataUseCase getChartDataUseCase(Ref ref) {
  return GetChartDataUseCaseImpl(
    repository: ref.watch(coinRepositoryProvider),
  );
}

@riverpod
GetNewsUseCase getNewsUseCase(Ref ref) {
  return GetNewsUseCaseImpl(
    repository: ref.watch(newsRepositoryProvider),
  );
}

@riverpod
AnalyzeCoinUseCase analyzeCoinUseCase(Ref ref) {
  return AnalyzeCoinUseCaseImpl(
    repository: ref.watch(aiRepositoryProvider),
  );
}

// ==================== WebSocket Connection State ====================

@riverpod
Stream<WebSocketConnectionState> wsConnectionState(Ref ref) async* {
  final wsDataHub = ref.watch(wsDataHubProvider);
  await for (final state in wsDataHub.connectionState) {
    yield state;
  }
}
