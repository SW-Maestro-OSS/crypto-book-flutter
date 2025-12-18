import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/home/home_state.dart';

part 'home_intent.freezed.dart';

/// Home 화면의 Intent (사용자 액션)
@freezed
sealed class HomeIntent with _$HomeIntent {
  /// 초기 로드
  const factory HomeIntent.load() = _Load;

  /// 새로고침
  const factory HomeIntent.refresh() = _Refresh;

  /// 정렬 변경
  const factory HomeIntent.sort(SortType sortType) = _Sort;

  /// 정렬 방향 토글
  const factory HomeIntent.toggleSortOrder() = _ToggleSortOrder;

  /// 코인 검색
  const factory HomeIntent.search(String query) = _Search;

  /// 실시간 티커 업데이트 (WebSocket)
  const factory HomeIntent.tickerUpdated(List<CoinTickerEntity> tickers) = _TickerUpdated;

  /// 더보기 (페이징)
  const factory HomeIntent.loadMore() = _LoadMore;
}
