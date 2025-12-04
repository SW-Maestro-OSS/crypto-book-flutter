import 'package:domain/entities/exchange_rate_entity.dart';

/// 환율 Repository
abstract interface class ExchangeRateRepository {
  /// 환율 조회
  Future<ExchangeRateEntity> getExchangeRate(String from, String to);
}
