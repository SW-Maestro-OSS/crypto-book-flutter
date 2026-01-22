import 'package:shared_preferences/shared_preferences.dart';
import 'package:data/dto/exchange_rate_dto.dart';
import 'dart:convert';

/// 환율 데이터 캐시 DataSource
class ExchangeRateCacheDataSource {
  static const String _cacheKeyPrefix = 'exchange_rate_';
  static const String _timestampKeyPrefix = 'exchange_rate_time_';
  static const Duration _cacheValidDuration = Duration(hours: 12);

  /// 환율 캐시 저장
  Future<void> cacheExchangeRate(ExchangeRateDTO dto) async {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey = _cacheKeyPrefix + dto.currencyCode;
    final timestampKey = _timestampKeyPrefix + dto.currencyCode;

    final jsonString = json.encode(dto.toMap());
    await prefs.setString(cacheKey, jsonString);
    await prefs.setInt(timestampKey, DateTime.now().millisecondsSinceEpoch);
  }

  /// 캐시된 환율 조회
  Future<ExchangeRateDTO?> getCachedExchangeRate(String currencyCode) async {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey = _cacheKeyPrefix + currencyCode;
    final timestampKey = _timestampKeyPrefix + currencyCode;

    final jsonString = prefs.getString(cacheKey);
    final timestamp = prefs.getInt(timestampKey);

    if (jsonString == null || timestamp == null) return null;

    // 캐시 유효성 검사
    final cachedTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    if (DateTime.now().difference(cachedTime) > _cacheValidDuration) {
      return null; // 만료된 캐시
    }

    try {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return ExchangeRateDTOMapper.fromMap(jsonMap);
    } catch (e) {
      return null;
    }
  }
}
