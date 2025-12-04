import 'package:domain/domain.dart';
import 'package:data/datasources/exchange_rate_data_source.dart';

class ExchangeRateRepositoryImpl implements ExchangeRateRepository {
  final ExchangeRateDataSource dataSource;

  ExchangeRateRepositoryImpl({required this.dataSource});

  @override
  Future<ExchangeRateEntity> getExchangeRate(
    String currencyCode,
    String targetCurrency,
  ) async {
    // 한국수출입은행 API는 KRW 기준 환율만 제공
    // currencyCode: USD, JPY 등 -> KRW 환율
    final dto = await dataSource.getExchangeRate(currencyCode);

    if (dto == null) {
      throw Exception('Exchange rate not found for $currencyCode');
    }

    return dto.toEntity();
  }

  /// 모든 환율 조회
  Future<List<ExchangeRateEntity>> getAllExchangeRates({
    String? searchDate,
  }) async {
    final dtos = await dataSource.getExchangeRates(searchDate: searchDate);
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
