import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_event.freezed.dart';

/// Setting 화면의 이벤트
@freezed
sealed class SettingEvent with _$SettingEvent {
  const factory SettingEvent.load() = _Load;
  const factory SettingEvent.changeCurrency(String currency) = _ChangeCurrency;
  const factory SettingEvent.changeLanguage(String language) = _ChangeLanguage;
}
