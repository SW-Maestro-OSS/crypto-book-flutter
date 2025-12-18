import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

/// 바이낸스 WebSocket 클라이언트
class BinanceWebSocketClient {
  final String baseUrl;
  WebSocketChannel? _channel;
  StreamController<List<Map<String, dynamic>>>? _controller;

  BinanceWebSocketClient({
    required this.baseUrl,
  });

  /// All Market Tickers Stream 구독
  /// Binance: wss://stream.binance.com:9443/ws/!ticker@arr
  Stream<List<Map<String, dynamic>>> subscribeAllTickers() {
    _controller = StreamController<List<Map<String, dynamic>>>.broadcast();

    try {
      final uri = Uri.parse('$baseUrl/ws/!ticker@arr');
      _channel = WebSocketChannel.connect(uri);

      _channel!.stream.listen(
        (data) {
          try {
            final decoded = json.decode(data);
            if (decoded is List) {
              final tickers = decoded.cast<Map<String, dynamic>>();
              _controller?.add(tickers);
            }
          } catch (e) {
            _controller?.addError('Failed to parse WebSocket data: $e');
          }
        },
        onError: (error) {
          _controller?.addError('WebSocket error: $error');
        },
        onDone: () {
          _controller?.close();
        },
      );
    } catch (e) {
      _controller?.addError('Failed to connect to WebSocket: $e');
    }

    return _controller!.stream;
  }

  /// 연결 해제
  Future<void> disconnect() async {
    await _channel?.sink.close();
    await _controller?.close();
    _channel = null;
    _controller = null;
  }
}
