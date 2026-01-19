import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';

part 'usecase_providers.g.dart';

/// GetCoinListUseCase Provider
/// 실제 구현체는 root app에서 override됨
@riverpod
GetCoinListUseCase getCoinListUseCase(Ref ref) {
  throw UnimplementedError(
    'getCoinListUseCaseProvider must be overridden in main app',
  );
}

/// SubscribeCoinTickerUseCase Provider
/// 실제 구현체는 root app에서 override됨
@riverpod
SubscribeCoinTickerUseCase subscribeCoinTickerUseCase(Ref ref) {
  throw UnimplementedError(
    'subscribeCoinTickerUseCaseProvider must be overridden in main app',
  );
}

/// GetSettingsUseCase Provider
/// 실제 구현체는 root app에서 override됨
@riverpod
GetSettingsUseCase getSettingsUseCase(Ref ref) {
  throw UnimplementedError(
    'getSettingsUseCaseProvider must be overridden in main app',
  );
}

/// SaveSettingsUseCase Provider
/// 실제 구현체는 root app에서 override됨
@riverpod
SaveSettingsUseCase saveSettingsUseCase(Ref ref) {
  throw UnimplementedError(
    'saveSettingsUseCaseProvider must be overridden in main app',
  );
}

/// GetExchangeRateUseCase Provider
/// 실제 구현체는 root app에서 override됨
@riverpod
GetExchangeRateUseCase getExchangeRateUseCase(Ref ref) {
  throw UnimplementedError(
    'getExchangeRateUseCaseProvider must be overridden in main app',
  );
}
