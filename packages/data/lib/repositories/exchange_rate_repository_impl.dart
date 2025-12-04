import 'package:domain/domain.dart';
import 'package:data/datasources/exchange_rate_data_source.dart';

class ExchangeRateRepositoryImpl implements ExchangeRateRepository {
  final ExchangeRateDataSource dataSource;

  ExchangeRateRepositoryImpl({required this.dataSource});

  @override
  Future<ExchangeRateEntity> getExchangeRate(String from, String to) async {
    // TODO: 실제 구현
    final dto = await dataSource.getExchangeRate(from, to);
    return dto.toEntity();
  }
}
