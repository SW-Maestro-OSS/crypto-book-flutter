import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_detail_side_effect.freezed.dart';

@freezed
sealed class CoinDetailSideEffect with _$CoinDetailSideEffect {
  const factory CoinDetailSideEffect.showError(String message) = _ShowError;
  const factory CoinDetailSideEffect.showToast(String message) = _ShowToast;
  const factory CoinDetailSideEffect.navigateBack() = _NavigateBack;
}
