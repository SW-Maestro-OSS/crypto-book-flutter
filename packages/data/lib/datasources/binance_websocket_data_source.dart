import 'package:data/dto/ticker_dto.dart';
import 'package:data/websocket/websocket_client.dart';

/// 바이낸스 WebSocket DataSource
class BinanceWebSocketDataSource {
  final BinanceWebSocketClient client;

  BinanceWebSocketDataSource({required this.client});

  /// 모든 코인 실시간 티커 구독
  /// All Market Tickers Stream (!ticker@arr)
  Stream<List<TickerDTO>> subscribeAllTickers() {
    return client.subscribeAllTickers().map((tickersJson) {
      return tickersJson
          .map((json) {
            try {
              return TickerDTOMapper.fromMap(json);
            } catch (e) {
              // 파싱 실패한 티커는 건너뜀
              return null;
            }
          })
          .whereType<TickerDTO>()
          .toList();
    });
  }
}
