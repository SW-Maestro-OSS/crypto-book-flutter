import 'app_error.dart';

/// WebSocket-related errors with connection state awareness
abstract class WebSocketError implements AppError {
  const WebSocketError();
}

/// WebSocket connection failed
class WebSocketConnectionError extends WebSocketError {
  final String details;

  const WebSocketConnectionError(this.details);

  @override
  String get userMessage => '실시간 연결에 실패했습니다. 다시 시도해주세요';

  @override
  String get technicalMessage => 'WebSocket connection error: $details';

  @override
  bool get isRecoverable => true;
}

/// WebSocket disconnected unexpectedly
class WebSocketDisconnectedError extends WebSocketError {
  final String? reason;

  const WebSocketDisconnectedError([this.reason]);

  @override
  String get userMessage => '연결이 끊어졌습니다. 재연결 중입니다';

  @override
  String get technicalMessage =>
      'WebSocket disconnected${reason != null ? ': $reason' : ''}';

  @override
  bool get isRecoverable => true;
}

/// WebSocket is attempting to reconnect
class WebSocketReconnectingError extends WebSocketError {
  final int attempt;

  const WebSocketReconnectingError(this.attempt);

  @override
  String get userMessage => '재연결 시도 중입니다 ($attempt번째)';

  @override
  String get technicalMessage => 'WebSocket reconnecting (attempt $attempt)';

  @override
  bool get isRecoverable => true;
}

/// WebSocket message parsing error
class WebSocketParseError extends WebSocketError {
  final String details;

  const WebSocketParseError(this.details);

  @override
  String get userMessage => '데이터를 처리하는 중 오류가 발생했습니다';

  @override
  String get technicalMessage => 'WebSocket parse error: $details';

  @override
  bool get isRecoverable => false;
}
