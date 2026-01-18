import 'dart:async';
import 'dart:developer' as dev;
import 'package:data/dto/ticker_dto.dart';
import 'package:data/websocket/websocket_client.dart';

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

  /// WebSocket subscription
  StreamSubscription? _wsSubscription;

  /// Whether the hub is currently connected
  bool _isConnected = false;

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
  }

  /// Initialize WebSocket connection
  void connect() {
    if (_isConnected) {
      dev.log('[WSDataHub] Already connected');
      return;
    }

    dev.log('[WSDataHub] Connecting to WebSocket...');

    _wsSubscription = _client.subscribeAllTickers().listen(
      (tickersJson) {
        try {
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
        _controller.addError(error);

        // Auto-reconnect after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          if (!_isConnected && !_controller.isClosed) {
            dev.log('[WSDataHub] Attempting reconnection...');
            connect();
          }
        });
      },
      onDone: () {
        dev.log('[WSDataHub] WebSocket connection closed');
        _isConnected = false;
      },
    );

    _isConnected = true;
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

    // Track last emitted price to avoid duplicates
    String? lastPrice = cached?.currentPrice;

    // Then stream real-time updates
    await for (final symbolMap in _controller.stream) {
      if (symbolMap.containsKey(symbol)) {
        final ticker = symbolMap[symbol]!;
        // Only emit if price changed
        if (lastPrice != ticker.currentPrice) {
          lastPrice = ticker.currentPrice;
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
    await _wsSubscription?.cancel();
    await _controller.close();
    await _client.disconnect();
    _symbolMap.clear();
  }

  /// Check if hub is connected
  bool get isConnected => _isConnected;

  /// Get number of symbols currently cached
  int get symbolCount => _symbolMap.length;
}
