import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.freezed.dart';

/// Splash 화면의 이벤트/Intent
@freezed
sealed class SplashEvent with _$SplashEvent {
  const factory SplashEvent.initialize() = _Initialize;
  const factory SplashEvent.retry() = _Retry;
}
