import 'dart:async';
import 'package:domain/domain.dart';

/// WebSocket 연결 상태를 구독하는 ViewModel mixin.
///
/// 사용법: ViewModel에서 `with WebSocketSubscriptionMixin` 후
/// build()에서 `subscribeWebSocket()` 호출.
mixin WebSocketSubscriptionMixin {
  StreamSubscription<WebSocketConnectionState>? _wsStateSubscription;

  /// Override하여 연결됐을 때 처리
  void onWsConnected() {}

  /// Override하여 끊겼을 때 처리
  void onWsDisconnected() {}

  /// WebSocket 상태 구독 시작. build()에서 호출.
  void subscribeWebSocket(Stream<WebSocketConnectionState> connectionState) {
    _wsStateSubscription?.cancel();
    _wsStateSubscription = connectionState.listen((state) {
      if (state == WebSocketConnectionState.connected) {
        onWsConnected();
      } else if (state == WebSocketConnectionState.disconnected ||
          state == WebSocketConnectionState.error) {
        onWsDisconnected();
      }
    });
  }

  void disposeWebSocketSubscription() {
    _wsStateSubscription?.cancel();
    _wsStateSubscription = null;
  }
}
