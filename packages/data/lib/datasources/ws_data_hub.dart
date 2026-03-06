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
/// Benefits:
/// - Single WebSocket connection shared across the app
/// - Instant symbol lookup via Map
/// - Hot stream (always emitting, no cold start)
/// - Automatic error recovery and reconnection
class WSDataHub {
  final BinanceWebSocketClient _client;

  /// In-memory map for O(1) symbol lookup
  final Map<String, TickerDTO> _symbolMap = {};

  /// Hot broadcast stream controller
  late final StreamController<Map<String, TickerDTO>> _controller;

  /// Connection state stream controller
  late final StreamController<WebSocketConnectionState> _connectionStateController;

  /// WebSocket subscription
  StreamSubscription? _wsSubscription;

  /// Whether the hub is currently connected
  bool _isConnected = false;

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
        // Keep connection alive for quick re-subscription
      },
    );
    _connectionStateController = StreamController<WebSocketConnectionState>.broadcast();
    _connectionStateController.add(WebSocketConnectionState.disconnected);
  }

  /// Initialize WebSocket connection
  void connect() {
    if (_isConnected) {
      dev.log('[WSDataHub] Already connected');
      return;
    }

    dev.log('[WSDataHub] Connecting to WebSocket...');
    _connectionStateController.add(WebSocketConnectionState.connecting);

    _wsSubscription = _client.subscribeAllTickers().listen(
      (tickersJson) {
        try {
          // First data received - we're connected!
          if (!_isConnected) {
            _isConnected = true;
            _reconnectAttempt = 0;
            _connectionStateController.add(WebSocketConnectionState.connected);
            dev.log('[WSDataHub] Connected successfully');
          }

          // Parse and update symbol map
          for (final json in tickersJson) {
            try {
              final ticker = TickerDTOMapper.fromMap(json);
              _symbolMap[ticker.symbol] = ticker;
            } catch (e) {
              dev.log('[WSDataHub] Failed to parse ticker: $e');
            }
          }

          // Broadcast updated map to all listeners
          if (!_controller.isClosed) {
            _controller.add(Map.from(_symbolMap));
          }
        } catch (e) {
          dev.log('[WSDataHub] Error processing tickers: $e');
          _controller.addError(e);
        }
      },
      onError: (error) {
        dev.log('[WSDataHub] WebSocket error: $error');
        _isConnected = false;
        _connectionStateController.add(WebSocketConnectionState.error);
        _controller.addError(error);

        // Schedule reconnection with exponential backoff
        _scheduleReconnect();
      },
      onDone: () {
        dev.log('[WSDataHub] WebSocket connection closed');
        _isConnected = false;
        _connectionStateController.add(WebSocketConnectionState.disconnected);

        // Schedule reconnection with exponential backoff
        _scheduleReconnect();
      },
    );
  }

  /// Schedule reconnection with exponential backoff
  void _scheduleReconnect() {
    // Cancel any pending reconnection timer
    _reconnectTimer?.cancel();

    if (_controller.isClosed) {
      dev.log('[WSDataHub] Controller closed, skipping reconnection');
      return;
    }

    _connectionStateController.add(WebSocketConnectionState.reconnecting);

    // Exponential backoff: 2^attempt seconds, capped at 30 seconds
    final delay = Duration(seconds: min(pow(2, _reconnectAttempt).toInt(), 30));
    dev.log('[WSDataHub] Scheduling reconnection in ${delay.inSeconds}s (attempt ${_reconnectAttempt + 1})');

    _reconnectTimer = Timer(delay, () {
      if (!_isConnected && !_controller.isClosed) {
        _reconnectAttempt++;
        dev.log('[WSDataHub] Attempting reconnection (attempt $_reconnectAttempt)');
        connect();
      }
    });
  }

  /// Get live stream for a specific symbol
  ///
  /// Returns a stream that emits whenever the symbol data updates.
  /// If the symbol doesn't exist, the stream will wait until it appears.
  Stream<TickerDTO> getSymbolStream(String symbol) async* {
    // Emit cached data immediately if available
    final cached = _symbolMap[symbol];
    if (cached != null) {
      yield cached;
    }

    // Track last emitted ticker to avoid unnecessary duplicates
    TickerDTO? lastTicker = cached;

    // Then stream real-time updates
    await for (final symbolMap in _controller.stream) {
      if (symbolMap.containsKey(symbol)) {
        final ticker = symbolMap[symbol]!;
        // Emit if any field changed (price, volume, high, low)
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
  ///
  /// Returns null if symbol not yet received from WebSocket.
  TickerDTO? getLatestTicker(String symbol) {
    return _symbolMap[symbol];
  }

  /// Get stream of all symbols (for home page)
  ///
  /// Emits the complete symbol map whenever any ticker updates.
  Stream<Map<String, TickerDTO>> getAllSymbolsStream() async* {
    // Emit cached data immediately if available
    if (_symbolMap.isNotEmpty) {
      yield Map.from(_symbolMap);
    }

    // Then stream real-time updates
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

    // Emit initial data
    if (!_controller.isClosed) {
      _controller.add(Map.from(_symbolMap));
    }
  }

  /// Disconnect and clean up
  Future<void> disconnect() async {
    dev.log('[WSDataHub] Disconnecting...');
    _isConnected = false;
    _reconnectTimer?.cancel();
    await _wsSubscription?.cancel();
    await _controller.close();
    await _connectionStateController.close();
    await _client.disconnect();
    _symbolMap.clear();
  }

  /// Check if hub is connected
  bool get isConnected => _isConnected;

  /// Get number of symbols currently cached
  int get symbolCount => _symbolMap.length;

  /// Get connection state stream
  Stream<WebSocketConnectionState> get connectionState => _connectionStateController.stream;
}
