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

/// GetThemeSettingUseCase Provider
/// 실제 구현체는 root app에서 override됨
@riverpod
GetThemeSettingUseCase getThemeSettingUseCase(Ref ref) {
  throw UnimplementedError(
    'getThemeSettingUseCaseProvider must be overridden in main app',
  );
}

/// UpdateThemeSettingUseCase Provider
/// 실제 구현체는 root app에서 override됨
@riverpod
UpdateThemeSettingUseCase updateThemeSettingUseCase(Ref ref) {
  throw UnimplementedError(
    'updateThemeSettingUseCaseProvider must be overridden in main app',
  );
}
