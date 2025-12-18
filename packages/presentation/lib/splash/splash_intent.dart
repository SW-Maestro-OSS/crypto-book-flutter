import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_intent.freezed.dart';

/// Splash 화면의 Intent (사용자 액션)
@freezed
sealed class SplashIntent with _$SplashIntent {
  const factory SplashIntent.initialize() = _Initialize;
  const factory SplashIntent.retry() = _Retry;
}
