import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_intent.freezed.dart';

/// Setting 화면의 Intent (사용자 액션)
@freezed
sealed class SettingIntent with _$SettingIntent {
  const factory SettingIntent.load() = _Load;
  const factory SettingIntent.changeCurrency(String currency) = _ChangeCurrency;
  const factory SettingIntent.changeLanguage(String language) = _ChangeLanguage;
}
