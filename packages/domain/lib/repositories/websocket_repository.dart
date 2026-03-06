/// WebSocket 연결 관리 Repository
abstract interface class WebSocketRepository {
  /// WebSocket 연결
  Future<void> connect();

  /// WebSocket 해제 (controller 유지, 재연결 가능)
  Future<void> disconnect();

  /// WebSocket 재연결
  Future<void> reconnect();

  /// 현재 연결 여부
  bool get isConnected;

  /// 연결 상태 스트림
  Stream<WebSocketConnectionState> get connectionState;

  /// 포그라운드/백그라운드 상태 설정
  void setForeground(bool isForeground);
}

/// WebSocket 연결 상태
enum WebSocketConnectionState {
  disconnected,
  connecting,
  connected,
  reconnecting,
  error,
}
