import 'package:dio/dio.dart';
import 'package:data/dto/exchange_rate_dto.dart';
import 'package:data/constants/exchange_rate_constants.dart';
import 'package:data/mappers/error_mapper.dart';
import 'package:domain/domain.dart';

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
      throw const GenericNetworkError('EXCHANGE_RATE_API_KEY is not configured in .env file');
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
        throw const GenericNetworkError('No data returned from API');
      }

      // API 응답이 List 형태로 옴
      final List<dynamic> jsonList = response.data is List
          ? response.data as List<dynamic>
          : [response.data];

      // 전체 응답 파싱 (필터링 전)
      final allDtos = jsonList
          .map((json) => ExchangeRateDTOMapper.fromMap(json as Map<String, dynamic>))
          .toList();

      // === 디버깅 로그 추가 ===
      print('=== Exchange Rate API Response ===');
      print('Total items: ${allDtos.length}');
      if (allDtos.isNotEmpty) {
        final firstItem = allDtos.first;
        print('First item - Currency: ${firstItem.currencyCode}, Result: ${firstItem.result}, IsSuccess: ${firstItem.isSuccess}');

        // USD 데이터 확인
        final usdItem = allDtos.where((dto) => dto.currencyCode == 'USD').firstOrNull;
        if (usdItem != null) {
          print('USD found - Result: ${usdItem.result}, Rate: ${usdItem.dealBaseRate}');
        } else {
          print('WARNING: USD not found in response!');
        }
      }

      // 필터링 후 개수 확인
      final successItems = allDtos.where((dto) => dto.isSuccess).toList();
      print('Success items after filter: ${successItems.length}');
      print('=====================================');

      // 성공한 항목이 없으면 에러 처리
      if (successItems.isEmpty && allDtos.isNotEmpty) {
        final firstItem = allDtos.first;
        switch (firstItem.result) {
          case 2:
            throw const ApiDataError('Invalid DATA code (result=2)');
          case 3:
            throw const ApiAuthenticationError();
          case 4:
            throw const ApiRateLimitError();
          default:
            throw ApiDataError('Unknown result code: ${firstItem.result}');
        }
      }

      return successItems;
    } on DioException catch (e) {
      throw ErrorMapper.fromDioException(e);
    } catch (e) {
      throw GenericNetworkError('Unexpected error: $e');
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
