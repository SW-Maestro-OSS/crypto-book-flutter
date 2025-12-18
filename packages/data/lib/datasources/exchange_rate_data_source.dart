import 'package:dio/dio.dart';
import 'package:data/dto/exchange_rate_dto.dart';
import 'package:data/constants/exchange_rate_constants.dart';

/// 한국수출입은행 환율 API DataSource
class ExchangeRateDataSource {
  final Dio _dio;

  ExchangeRateDataSource({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: ExchangeRateConstants.baseUrl,
                connectTimeout: Duration(
                  milliseconds: ExchangeRateConstants.connectTimeout,
                ),
                receiveTimeout: Duration(
                  milliseconds: ExchangeRateConstants.receiveTimeout,
                ),
              ),
            );

  /// 환율 조회
  ///
  /// [searchDate] 검색 날짜 (YYYYMMDD 또는 YYYY-MM-DD 형식, 기본값: 현재일)
  ///
  /// 예시: getExchangeRates() 또는 getExchangeRates(searchDate: '20250102')
  Future<List<ExchangeRateDTO>> getExchangeRates({String? searchDate}) async {
    final apiKey = ExchangeRateConstants.apiKey;

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('EXCHANGE_RATE_API_KEY is not configured in .env file');
    }

    try {
      final response = await _dio.get(
        ExchangeRateConstants.exchangeRateEndpoint,
        queryParameters: {
          'authkey': apiKey,
          'data': ExchangeRateConstants.dataTypeExchangeRate,
          if (searchDate != null) 'searchdate': searchDate,
        },
      );

      if (response.data == null) {
        throw Exception('No data returned from API');
      }

      // API 응답이 List 형태로 옴
      final List<dynamic> jsonList = response.data is List
          ? response.data as List<dynamic>
          : [response.data];

      return jsonList
          .map((json) => ExchangeRateDTOMapper.fromMap(json as Map<String, dynamic>))
          .where((dto) => dto.isSuccess) // 성공한 응답만 필터링
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch exchange rates: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// 특정 통화의 환율 조회
  ///
  /// [currencyCode] 통화코드 (예: 'USD', 'JPY', 'EUR')
  /// [searchDate] 검색 날짜 (YYYYMMDD 또는 YYYY-MM-DD 형식, 기본값: 현재일)
  Future<ExchangeRateDTO?> getExchangeRate(
    String currencyCode, {
    String? searchDate,
  }) async {
    final rates = await getExchangeRates(searchDate: searchDate);

    try {
      return rates.firstWhere(
        (rate) => rate.currencyCode == currencyCode,
      );
    } catch (e) {
      return null;
    }
  }
}
