import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'coin_detail_event.freezed.dart';

/// Coin Detail 화면의 이벤트
@freezed
sealed class CoinDetailEvent with _$CoinDetailEvent {
  const factory CoinDetailEvent.load(String symbol) = _Load;
  const factory CoinDetailEvent.tickerUpdated(CoinTickerEntity ticker) = _TickerUpdated;
}
