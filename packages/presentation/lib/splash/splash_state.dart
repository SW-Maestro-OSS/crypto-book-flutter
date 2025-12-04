import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

/// Splash 화면의 상태 (불변 객체)
@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.completed() = _Completed;
  const factory SplashState.error(String message) = _Error;
}
