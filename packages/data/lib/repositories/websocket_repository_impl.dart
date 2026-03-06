import 'package:domain/domain.dart';
import 'package:data/datasources/ws_data_hub.dart';

class WebSocketRepositoryImpl implements WebSocketRepository {
  final WSDataHub _wsDataHub;

  WebSocketRepositoryImpl({required WSDataHub wsDataHub})
      : _wsDataHub = wsDataHub;

  @override
  Future<void> connect() async => _wsDataHub.connect();

  @override
  Future<void> disconnect() async => await _wsDataHub.disconnect();

  @override
  Future<void> reconnect() async => await _wsDataHub.reconnect();

  @override
  Stream<WebSocketConnectionState> get connectionState =>
      _wsDataHub.connectionState;

  @override
  bool get isConnected => _wsDataHub.isConnected;

  @override
  void setForeground(bool isForeground) =>
      _wsDataHub.setForeground(isForeground);
}
