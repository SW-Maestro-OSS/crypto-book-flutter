import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:data/dto/ticker_dto.dart';
import 'package:data/websocket/websocket_client.dart';
import 'package:domain/domain.dart';

/// Centralized WebSocket data hub with hot stream and Map-based symbol lookup.
///
/// This class manages a single WebSocket connection and maintains an in-memory
/// Map of all ticker data for O(1) symbol lookups. It provides both:
/// - A hot broadcast stream of all symbols (for home page)
/// - Individual symbol streams (for detail pages)
///
/// disconnect()는 소켓만 닫고 controller를 유지하여 재연결이 가능하다.
/// dispose()에서 controller를 닫아 완전히 정리한다.
class WSDataHub {
  final BinanceWebSocketClient _client;

  /// In-memory map for O(1) symbol lookup
  final Map<String, TickerDTO> _symbolMap = {};

  /// Hot broadcast stream controller
  late final StreamController<Map<String, TickerDTO>> _controller;

  /// Connection state stream controller
  late final StreamController<WebSocketConnectionState>
      _connectionStateController;

  /// WebSocket subscription
  StreamSubscription? _wsSubscription;

  /// Whether the hub is currently connected
  bool _isConnected = false;

  /// Whether the hub has been disposed
  bool _isDisposed = false;

  /// Whether the app is in foreground
  bool _isForeground = true;

  /// Reconnection attempt counter
  int _reconnectAttempt = 0;

  /// Reconnection timer
  Timer? _reconnectTimer;

  WSDataHub({required BinanceWebSocketClient client}) : _client = client {
    _controller = StreamController<Map<String, TickerDTO>>.broadcast(
      onListen: () {
        dev.log('[WSDataHub] First listener attached');
        if (!_isConnected) {
          connect();
        }
      },
      onCancel: () {
        dev.log('[WSDataHub] Last listener detached');
      },
    );
    _connectionStateController =
        StreamController<WebSocketConnectionState>.broadcast();
    _connectionStateController.add(WebSocketConnectionState.disconnected);
  }

  /// Initialize WebSocket connection
  void connect() {
    if (_isConnected || _isDisposed) {
      dev.log('[WSDataHub] Already connected or disposed');
      return;
    }

    dev.log('[WSDataHub] Connecting to WebSocket...');
    _connectionStateController.add(WebSocketConnectionState.connecting);

    // 기존 subscription 정리
    _wsSubscription?.cancel();

    _client.connect().then((_) {
      _wsSubscription = _client.tickerStream.listen(
        (tickersJson) {
          try {
            if (!_isConnected) {
              _isConnected = true;
              _reconnectAttempt = 0;
              _connectionStateController
                  .add(WebSocketConnectionState.connected);
              dev.log('[WSDataHub] Connected successfully');
            }

            for (final json in tickersJson) {
              try {
                final ticker = TickerDTOMapper.fromMap(json);
                _symbolMap[ticker.symbol] = ticker;
              } catch (e) {
                dev.log('[WSDataHub] Failed to parse ticker: $e');
              }
            }

            if (!_controller.isClosed) {
              _controller.add(Map.from(_symbolMap));
            }
          } catch (e) {
            dev.log('[WSDataHub] Error processing tickers: $e');
            if (!_controller.isClosed) {
              _controller.addError(e);
            }
          }
        },
        onError: (error) {
          dev.log('[WSDataHub] WebSocket error: $error');
          _isConnected = false;
          _connectionStateController.add(WebSocketConnectionState.error);
          if (!_controller.isClosed) {
            _controller.addError(error);
          }
          if (_isForeground) _scheduleReconnect();
        },
        onDone: () {
          dev.log('[WSDataHub] WebSocket connection closed');
          _isConnected = false;
          _connectionStateController
              .add(WebSocketConnectionState.disconnected);
          if (_isForeground) _scheduleReconnect();
        },
      );
    }).catchError((e) {
      dev.log('[WSDataHub] Failed to connect: $e');
      _isConnected = false;
      _connectionStateController.add(WebSocketConnectionState.error);
      if (_isForeground) _scheduleReconnect();
    });
  }

  /// Schedule reconnection with exponential backoff
  void _scheduleReconnect() {
    _reconnectTimer?.cancel();

    if (_controller.isClosed || _isDisposed) {
      dev.log('[WSDataHub] Controller closed or disposed, skipping reconnection');
      return;
    }

    _connectionStateController.add(WebSocketConnectionState.reconnecting);

    final delay =
        Duration(seconds: min(pow(2, _reconnectAttempt).toInt(), 30));
    dev.log(
        '[WSDataHub] Scheduling reconnection in ${delay.inSeconds}s (attempt ${_reconnectAttempt + 1})');

    _reconnectTimer = Timer(delay, () {
      if (!_isConnected && !_controller.isClosed && !_isDisposed) {
        _reconnectAttempt++;
        dev.log(
            '[WSDataHub] Attempting reconnection (attempt $_reconnectAttempt)');
        connect();
      }
    });
  }

  /// 재연결 (외부에서 명시적으로 호출)
  Future<void> reconnect() async {
    _reconnectTimer?.cancel();
    _reconnectAttempt = 0;
    await _wsSubscription?.cancel();
    await _client.disconnect();
    _isConnected = false;
    connect();
  }

  /// Get live stream for a specific symbol
  Stream<TickerDTO> getSymbolStream(String symbol) async* {
    final cached = _symbolMap[symbol];
    if (cached != null) {
      yield cached;
    }

    TickerDTO? lastTicker = cached;

    await for (final symbolMap in _controller.stream) {
      if (symbolMap.containsKey(symbol)) {
        final ticker = symbolMap[symbol]!;
        final prev = lastTicker;
        if (prev == null ||
            prev.currentPrice != ticker.currentPrice ||
            prev.volume != ticker.volume ||
            prev.high != ticker.high ||
            prev.low != ticker.low) {
          lastTicker = ticker;
          yield ticker;
        }
      }
    }
  }

  /// Get latest cached ticker for a symbol (synchronous)
  TickerDTO? getLatestTicker(String symbol) {
    return _symbolMap[symbol];
  }

  /// Get stream of all symbols (for home page)
  Stream<Map<String, TickerDTO>> getAllSymbolsStream() async* {
    if (_symbolMap.isNotEmpty) {
      yield Map.from(_symbolMap);
    }

    await for (final symbolMap in _controller.stream) {
      yield symbolMap;
    }
  }

  /// Get current snapshot of all symbols (synchronous)
  Map<String, TickerDTO> getAllSymbols() {
    return Map.from(_symbolMap);
  }

  /// Load initial data into the map (e.g., from cache on startup)
  void loadInitialData(List<TickerDTO> tickers) {
    for (final ticker in tickers) {
      _symbolMap[ticker.symbol] = ticker;
    }
    dev.log('[WSDataHub] Loaded ${tickers.length} tickers from cache');

    if (!_controller.isClosed) {
      _controller.add(Map.from(_symbolMap));
    }
  }

  /// 연결만 끊음 - controller 유지 (재연결 가능)
  Future<void> disconnect() async {
    dev.log('[WSDataHub] Disconnecting...');
    _reconnectTimer?.cancel();
    _isConnected = false;
    await _wsSubscription?.cancel();
    _wsSubscription = null;
    await _client.disconnect();
    if (!_connectionStateController.isClosed) {
      _connectionStateController
          .add(WebSocketConnectionState.disconnected);
    }
  }

  /// 완전 정리 - 앱 종료 시
  Future<void> dispose() async {
    dev.log('[WSDataHub] Disposing...');
    _isDisposed = true;
    await disconnect();
    await _controller.close();
    await _connectionStateController.close();
    _symbolMap.clear();
  }

  /// 포그라운드/백그라운드 상태 설정
  void setForeground(bool isForeground) {
    _isForeground = isForeground;
    dev.log('[WSDataHub] Foreground: $isForeground');
  }

  /// Check if hub is connected
  bool get isConnected => _isConnected;

  /// Get number of symbols currently cached
  int get symbolCount => _symbolMap.length;

  /// Get connection state stream
  Stream<WebSocketConnectionState> get connectionState =>
      _connectionStateController.stream;
}
