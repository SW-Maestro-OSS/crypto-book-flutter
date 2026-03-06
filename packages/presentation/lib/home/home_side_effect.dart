import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_side_effect.freezed.dart';

@freezed
sealed class HomeSideEffect with _$HomeSideEffect {
  const factory HomeSideEffect.showError(String message) = _ShowError;
  const factory HomeSideEffect.showToast(String message) = _ShowToast;
}
