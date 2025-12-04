import 'package:data/dto/exchange_rate_dto.dart';

/// 환율 DataSource
class ExchangeRateDataSource {
  final String baseUrl;

  ExchangeRateDataSource({required this.baseUrl});

  /// 환율 조회
  Future<ExchangeRateDTO> getExchangeRate(String from, String to) async {
    // TODO: 실제 API 호출 구현
    // 예: https://api.exchangerate.host/latest?base=KRW&symbols=USD
    throw UnimplementedError('getExchangeRate not implemented yet');
  }
}
