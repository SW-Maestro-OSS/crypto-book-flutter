import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

/// Setting 화면의 상태
@freezed
sealed class SettingState with _$SettingState {
  const factory SettingState.initial() = _Initial;
  const factory SettingState.loaded({
    @Default('USD') String currency,
    @Default('en') String language,
  }) = _Loaded;
}
