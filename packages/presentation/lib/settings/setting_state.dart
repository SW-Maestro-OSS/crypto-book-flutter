import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'setting_state.freezed.dart';

/// Setting 화면의 상태
@freezed
sealed class SettingState with _$SettingState {
  const factory SettingState.initial() = _Initial;
  const factory SettingState.loading() = _Loading;
  const factory SettingState.loaded({
    @Default('USD') String currency,
    @Default('en') String language,
    ExchangeRateEntity? exchangeRate,
    DateTime? lastUpdated,
  }) = _Loaded;
  const factory SettingState.error(AppError error) = _Error;
}
