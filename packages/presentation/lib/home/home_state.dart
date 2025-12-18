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

/// 정렬 타입 (Dart 3 Enhanced Enum)
enum SortType {
  none('정렬 없음'),
  symbol('심볼'),
  price('가격'),
  changePercent('변동률'),
  volume('거래량');

  const SortType(this.label);
  final String label;

  /// 정렬 함수 반환 (switch expression 사용)
  int Function(CoinTickerEntity, CoinTickerEntity)? get comparator => switch (this) {
    SortType.none => null,
    SortType.symbol => (a, b) => a.symbol.compareTo(b.symbol),
    SortType.price => (a, b) => a.currentPrice.compareTo(b.currentPrice),
    SortType.changePercent => (a, b) => a.priceChangePercent24h.compareTo(b.priceChangePercent24h),
    SortType.volume => (a, b) => a.volume24h.compareTo(b.volume24h),
  };
}
