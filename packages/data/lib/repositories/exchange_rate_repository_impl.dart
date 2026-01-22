import 'package:domain/domain.dart';
import 'package:data/datasources/exchange_rate_data_source.dart';
import 'package:data/datasources/exchange_rate_cache_data_source.dart';

class ExchangeRateRepositoryImpl implements ExchangeRateRepository {
  final ExchangeRateDataSource dataSource;
  final ExchangeRateCacheDataSource cacheDataSource;

  ExchangeRateRepositoryImpl({
    required this.dataSource,
    required this.cacheDataSource,
  });

  @override
  Future<ExchangeRateEntity> getExchangeRate(
    String currencyCode,
    String targetCurrency,
  ) async {
    try {
      // 1. API에서 데이터 가져오기
      final dto = await dataSource.getExchangeRate(currencyCode);

      if (dto != null) {
        // 성공 시 캐시에 저장
        await cacheDataSource.cacheExchangeRate(dto);
        return dto.toEntity();
      }
    } on ApiRateLimitError catch (e) {
      // 2. Rate limit 시 캐시 시도
      print('Rate limit exceeded, trying cache: ${e.technicalMessage}');
      final cachedDto = await cacheDataSource.getCachedExchangeRate(currencyCode);
      if (cachedDto != null) {
        print('Using cached exchange rate for $currencyCode');
        return cachedDto.toEntity();
      }
      // 캐시 없으면 fallback
      return _getFallbackRate(currencyCode);
    } on ApiAuthenticationError {
      // 3. 인증 실패 시 에러 재발생 (사용자가 설정 확인 필요)
      rethrow;
    } on NetworkError catch (e) {
      // 4. 네트워크 에러 시 캐시 시도
      print('Network error, trying cache: ${e.technicalMessage}');
      final cachedDto = await cacheDataSource.getCachedExchangeRate(currencyCode);
      if (cachedDto != null) {
        return cachedDto.toEntity();
      }
      // 캐시 없으면 fallback
      return _getFallbackRate(currencyCode);
    } catch (e) {
      print('Unexpected error: $e');
      // 예상치 못한 에러 시 캐시 시도
      final cachedDto = await cacheDataSource.getCachedExchangeRate(currencyCode);
      if (cachedDto != null) {
        return cachedDto.toEntity();
      }
    }

    throw SymbolNotFoundError('Exchange rate not found for $currencyCode');
  }

  /// Fallback 환율 (고정값)
  ExchangeRateEntity _getFallbackRate(String currencyCode) {
    final fallbackRates = {
      'USD': 1300.0,
      'JPY': 900.0, // 100엔 기준
      'EUR': 1400.0,
      'CNY': 180.0,
    };

    final rate = fallbackRates[currencyCode];
    if (rate == null) {
      throw SymbolNotFoundError('No fallback rate for $currencyCode');
    }

    print('WARNING: Using fallback rate for $currencyCode: $rate');

    return ExchangeRateEntity(
      fromCurrency: currencyCode,
      toCurrency: 'KRW',
      rate: rate,
      timestamp: DateTime.now(),
    );
  }

  /// 모든 환율 조회
  Future<List<ExchangeRateEntity>> getAllExchangeRates({
    String? searchDate,
  }) async {
    final dtos = await dataSource.getExchangeRates(searchDate: searchDate);
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
