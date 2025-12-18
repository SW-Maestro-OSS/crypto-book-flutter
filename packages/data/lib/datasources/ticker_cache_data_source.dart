import 'package:hive/hive.dart';
import 'package:data/dto/ticker_dto.dart';

/// Ticker 캐싱을 담당하는 DataSource
/// - In-memory cache (Map)
/// - Persistent storage (Hive Box with JSON strings)
class TickerCacheDataSource {
  // In-memory cache: Map<symbol, TickerDTO>
  final Map<String, TickerDTO> _cache = {};

  // Hive Box (lazy initialization)
  Box<String>? _tickerBox;

  // Last update timestamp (for staleness detection)
  DateTime? _lastUpdate;

  // Configuration
  static const String _boxName = 'ticker_cache';
  static const int _maxCacheSize = 1000;
  static const Duration _maxCacheAge = Duration(hours: 24);

  /// Initialize Hive box and load from disk
  Future<void> init() async {
    try {
      _tickerBox = await Hive.openBox<String>(_boxName);
      await _loadFromDisk();
    } catch (e) {
      // Hive initialization failed, continue without cache
      print('TickerCache init failed: $e');
    }
  }

  /// Get all cached tickers
  List<TickerDTO> getAll() {
    return _cache.values.toList();
  }

  /// Update multiple tickers (merge strategy)
  /// - Update existing tickers
  /// - Add new tickers
  /// - Preserve unchanged tickers
  Future<void> updateMany(List<TickerDTO> incomingTickers) async {
    // Merge incoming tickers into cache
    for (final ticker in incomingTickers) {
      _cache[ticker.symbol] = ticker;
    }

    // Update timestamp
    _lastUpdate = DateTime.now();

    // Prune cache if size exceeded
    await _pruneCache();

    // Save to disk
    await _saveToDisk();
  }

  /// Clear all cached data
  Future<void> clear() async {
    _cache.clear();
    await _tickerBox?.clear();
    _lastUpdate = null;
  }

  /// Check if cache is stale (> 24 hours old)
  bool get isStale {
    if (_lastUpdate == null) return true;
    return DateTime.now().difference(_lastUpdate!) > _maxCacheAge;
  }

  /// Get last update timestamp
  DateTime? get lastUpdate => _lastUpdate;

  /// Save cache to Hive (JSON strings)
  Future<void> _saveToDisk() async {
    if (_tickerBox == null) return;

    try {
      // Save all cache entries to Hive
      for (final entry in _cache.entries) {
        final json = entry.value.toJson();
        await _tickerBox!.put(entry.key, json);
      }

      // Save timestamp
      await _tickerBox!.put('_lastUpdate', _lastUpdate?.toIso8601String() ?? '');
    } catch (e) {
      // Disk save failed, continue with in-memory cache
      print('TickerCache save failed: $e');
    }
  }

  /// Load cache from Hive to memory
  Future<void> _loadFromDisk() async {
    if (_tickerBox == null) return;

    try {
      // Load all entries from Hive
      for (final key in _tickerBox!.keys) {
        if (key == '_lastUpdate') {
          // Load timestamp
          final timestampStr = _tickerBox!.get(key);
          if (timestampStr != null && timestampStr.isNotEmpty) {
            _lastUpdate = DateTime.tryParse(timestampStr);
          }
        } else {
          // Load ticker
          final json = _tickerBox!.get(key);
          if (json != null) {
            try {
              final dto = TickerDTOMapper.fromJson(json);
              _cache[key as String] = dto;
            } catch (e) {
              // Skip corrupted entry
              print('Skip corrupted ticker: $key');
            }
          }
        }
      }
    } catch (e) {
      // Load failed, start with empty cache
      print('TickerCache load failed: $e');
    }
  }

  /// Prune cache to max size limit (keep top tickers by quoteVolume)
  Future<void> _pruneCache() async {
    if (_cache.length <= _maxCacheSize) return;

    // Sort by quoteVolume (descending)
    final sorted = _cache.values.toList()
      ..sort((a, b) {
        final aVolume = double.tryParse(a.quoteVolume) ?? 0.0;
        final bVolume = double.tryParse(b.quoteVolume) ?? 0.0;
        return bVolume.compareTo(aVolume);
      });

    // Keep only top N tickers
    final toKeep = sorted.take(_maxCacheSize).map((t) => t.symbol).toSet();

    // Remove excess tickers from memory
    _cache.removeWhere((symbol, _) => !toKeep.contains(symbol));

    // Remove excess tickers from disk
    if (_tickerBox != null) {
      final keysToDelete = _tickerBox!.keys
          .where((key) => key != '_lastUpdate' && !toKeep.contains(key))
          .toList();

      for (final key in keysToDelete) {
        await _tickerBox!.delete(key);
      }
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    await _tickerBox?.close();
  }
}
