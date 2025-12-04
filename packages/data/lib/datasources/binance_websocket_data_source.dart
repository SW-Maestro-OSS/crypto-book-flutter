import 'package:data/dto/ticker_dto.dart';
import 'package:data/websocket/websocket_client.dart';

/// 바이낸스 WebSocket DataSource (구조만 준비)
class BinanceWebSocketDataSource {
  final BinanceWebSocketClient client;

  BinanceWebSocketDataSource({required this.client});

  /// 실시간 티커 구독
  Stream<TickerDTO> subscribeTicker(String symbol) {
    // TODO: 실제 구현
    throw UnimplementedError('WebSocket ticker subscription not implemented yet');
  }
}
