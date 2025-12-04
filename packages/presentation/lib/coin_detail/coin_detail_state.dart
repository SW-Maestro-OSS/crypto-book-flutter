import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'coin_detail_state.freezed.dart';

/// Coin Detail 화면의 상태
@freezed
sealed class CoinDetailState with _$CoinDetailState {
  const factory CoinDetailState.initial() = _Initial;
  const factory CoinDetailState.loading() = _Loading;
  const factory CoinDetailState.loaded({
    required CoinTickerEntity ticker,
    // TODO: 차트 데이터, 거래 내역 등
  }) = _Loaded;
  const factory CoinDetailState.error(String message) = _Error;
}
