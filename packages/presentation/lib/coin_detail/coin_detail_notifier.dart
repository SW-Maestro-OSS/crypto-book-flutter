import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/coin_detail/coin_detail_state.dart';
import 'package:presentation/coin_detail/coin_detail_event.dart';

part 'coin_detail_notifier.g.dart';

@riverpod
class CoinDetailNotifier extends _$CoinDetailNotifier {
  @override
  CoinDetailState build(String symbol) {
    return const CoinDetailState.initial();
  }

  void onEvent(CoinDetailEvent event) {
    event.when(
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
