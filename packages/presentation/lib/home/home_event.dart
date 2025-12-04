import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/home/home_state.dart';

part 'home_event.freezed.dart';

/// Home 화면의 이벤트/Intent
@freezed
sealed class HomeEvent with _$HomeEvent {
  /// 초기 로드
  const factory HomeEvent.load() = _Load;

  /// 새로고침
  const factory HomeEvent.refresh() = _Refresh;

  /// 정렬 변경
  const factory HomeEvent.sort(SortType sortType) = _Sort;

  /// 정렬 방향 토글
  const factory HomeEvent.toggleSortOrder() = _ToggleSortOrder;

  /// 코인 검색
  const factory HomeEvent.search(String query) = _Search;

  /// 실시간 티커 업데이트 (WebSocket)
  const factory HomeEvent.tickerUpdated(List<CoinTickerEntity> tickers) = _TickerUpdated;

  /// 더보기 (페이징)
  const factory HomeEvent.loadMore() = _LoadMore;
}
