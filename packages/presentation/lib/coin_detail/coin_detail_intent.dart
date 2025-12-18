import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'coin_detail_intent.freezed.dart';

/// Coin Detail 화면의 Intent (사용자 액션)
@freezed
sealed class CoinDetailIntent with _$CoinDetailIntent {
  const factory CoinDetailIntent.load(String symbol) = _Load;
  const factory CoinDetailIntent.tickerUpdated(CoinTickerEntity ticker) = _TickerUpdated;
}
