import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/coin_detail/coin_detail_state.dart';
import 'package:presentation/coin_detail/coin_detail_intent.dart';

part 'coin_detail_viewmodel.g.dart';

/// Coin Detail 화면의 ViewModel (비즈니스 로직)
@riverpod
class CoinDetailViewModel extends _$CoinDetailViewModel {
  @override
  CoinDetailState build(String symbol) {
    return const CoinDetailState.initial();
  }

  /// Intent 처리
  void onIntent(CoinDetailIntent intent) {
    intent.when(
      load: _handleLoad,
      tickerUpdated: _handleTickerUpdated,
    );
  }

  Future<void> _handleLoad(String symbol) async {
    state = const CoinDetailState.loading();

    // TODO: 실제 구현
    // - WebSocket에서 특정 코인 구독
    // - 또는 Home 스트림에서 필터링
  }

  void _handleTickerUpdated(CoinTickerEntity ticker) {
    // TODO: 실제 구현
    state = CoinDetailState.loaded(ticker: ticker);
  }
}
