import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:domain/domain.dart';

/// 바이낸스 WebSocket 클라이언트
///
/// connect()/disconnect()로 소켓 수명을 관리하고,
/// tickerStream getter로 데이터를 수신한다.
/// StreamController는 클래스 수명과 동일하게 유지되어 reconnect가 가능하다.
class BinanceWebSocketClient {
  final String baseUrl;
  WebSocket? _socket;
  final StreamController<List<Map<String, dynamic>>> _controller =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  bool _isDisposed = false;

  BinanceWebSocketClient({
    required this.baseUrl,
  });

  /// 티커 데이터 스트림 (broadcast)
  Stream<List<Map<String, dynamic>>> get tickerStream => _controller.stream;

  /// 현재 소켓이 연결되어 있는지 여부
  bool get isConnected =>
      _socket != null && _socket!.readyState == WebSocket.open;

  /// WebSocket 연결
  Future<void> connect() async {
    if (_isDisposed) return;
    await _socket?.close();

    try {
      final uri = Uri.parse('$baseUrl/ws/!ticker@arr');
      _socket = await WebSocket.connect(uri.toString());
      _socket!.pingInterval = const Duration(seconds: 15);

      _socket!.listen(
        (data) {
          try {
            final decoded = json.decode(data);
            if (decoded is List) {
              final tickers = decoded.cast<Map<String, dynamic>>();
              if (!_controller.isClosed) {
                _controller.add(tickers);
              }
            }
          } catch (e) {
            if (!_controller.isClosed) {
              _controller.addError(
                  WebSocketParseError('Failed to parse WebSocket data: $e'));
            }
          }
        },
        onError: (error) {
          if (!_controller.isClosed) {
            _controller
                .addError(WebSocketDisconnectedError(error.toString()));
          }
        },
        onDone: () {
          // controller를 닫지 않음 → 상위(WSDataHub)에서 reconnect 판단
          _socket = null;
        },
      );
    } catch (e) {
      if (!_controller.isClosed) {
        _controller.addError(
            WebSocketConnectionError('Failed to connect to WebSocket: $e'));
      }
      rethrow;
    }
  }

  /// 소켓만 닫음 (controller 유지 → 재연결 가능)
  Future<void> disconnect() async {
    await _socket?.close();
    _socket = null;
  }

  /// 완전 정리 (앱 종료 시)
  Future<void> dispose() async {
    _isDisposed = true;
    await disconnect();
    await _controller.close();
  }
}
