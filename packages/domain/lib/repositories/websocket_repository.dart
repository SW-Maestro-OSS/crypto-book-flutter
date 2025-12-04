/// WebSocket 연결 관리 Repository
abstract interface class WebSocketRepository {
  /// WebSocket 연결
  Future<void> connect();

  /// WebSocket 해제
  Future<void> disconnect();

  /// WebSocket 재연결
  Future<void> reconnect();

  /// 연결 상태 스트림
  Stream<WebSocketConnectionState> connectionState();
}

/// WebSocket 연결 상태
enum WebSocketConnectionState {
  disconnected,
  connecting,
  connected,
  reconnecting,
  error,
}
