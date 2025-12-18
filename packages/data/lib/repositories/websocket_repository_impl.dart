import 'package:domain/domain.dart';
import 'package:data/websocket/websocket_client.dart';

class WebSocketRepositoryImpl implements WebSocketRepository {
  final BinanceWebSocketClient client;

  WebSocketRepositoryImpl({required this.client});

  @override
  Future<void> connect() async {
    // WebSocket은 subscribeAllTickers() 호출 시 자동으로 연결됨
    // 별도의 connect() 호출 불필요
  }

  @override
  Future<void> disconnect() async {
    // TODO: 실제 구현
    await client.disconnect();
  }

  @override
  Future<void> reconnect() async {
    // TODO: 실제 구현
    await disconnect();
    await connect();
  }

  @override
  Stream<WebSocketConnectionState> connectionState() {
    // TODO: 실제 구현
    throw UnimplementedError('connectionState not implemented yet');
  }
}
