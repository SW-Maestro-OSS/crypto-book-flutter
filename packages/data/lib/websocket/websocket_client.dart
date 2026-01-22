import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:domain/domain.dart';

/// 바이낸스 WebSocket 클라이언트
class BinanceWebSocketClient {
  final String baseUrl;
  WebSocket? _socket;
  StreamController<List<Map<String, dynamic>>>? _controller;

  BinanceWebSocketClient({
    required this.baseUrl,
  });

  /// All Market Tickers Stream 구독
  /// Binance: wss://stream.binance.com:9443/ws/!ticker@arr
  ///
  /// pingInterval을 15초로 설정하여 바이낸스 서버의 ping(20초)에 자동으로 pong 응답
  Stream<List<Map<String, dynamic>>> subscribeAllTickers() {
    _controller = StreamController<List<Map<String, dynamic>>>.broadcast();

    _connectWebSocket();

    return _controller!.stream;
  }

  Future<void> _connectWebSocket() async {
    try {
      final uri = Uri.parse('$baseUrl/ws/!ticker@arr');

      // dart:io WebSocket with automatic ping-pong handling
      _socket = await WebSocket.connect(
        uri.toString(),
      );
      // pingInterval 설정 (클라이언트 → 서버 ping)
      _socket!.pingInterval = const Duration(seconds: 15);

      _socket!.listen(
        (data) {
          try {
            final decoded = json.decode(data);
            if (decoded is List) {
              final tickers = decoded.cast<Map<String, dynamic>>();
              _controller?.add(tickers);
            }
          } catch (e) {
            _controller?.addError(
                WebSocketParseError('Failed to parse WebSocket data: $e'));
          }
        },
        onError: (error) {
          _controller?.addError(WebSocketDisconnectedError(error.toString()));
        },
        onDone: () {
          _controller?.close();
        },
      );
    } catch (e) {
      _controller?.addError(
          WebSocketConnectionError('Failed to connect to WebSocket: $e'));
    }
  }

  /// 연결 해제
  Future<void> disconnect() async {
    await _socket?.close();
    await _controller?.close();
    _socket = null;
    _controller = null;
  }
}
