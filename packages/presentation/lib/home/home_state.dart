import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'home_state.freezed.dart';

/// Home 화면의 상태 (불변 객체)
@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required List<CoinTickerEntity> allTickers,
    required List<CoinTickerEntity> displayedTickers,
    @Default(10) int displayCount,
    @Default(SortType.none) SortType sortType,
    @Default(false) bool isAscending,
  }) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}

/// 정렬 타입
enum SortType {
  none,           // 정렬 없음
  symbol,         // 심볼 이름
  price,          // 가격
  changePercent,  // 변동률
  volume,         // 거래량
}
