import 'package:domain/entities/exchange_rate_entity.dart';
import 'package:domain/repositories/exchange_rate_repository.dart';

/// 환율 조회 UseCase
abstract interface class GetExchangeRateUseCase {
  Future<ExchangeRateEntity> execute(String from, String to);
}

class GetExchangeRateUseCaseImpl implements GetExchangeRateUseCase {
  final ExchangeRateRepository repository;

  GetExchangeRateUseCaseImpl({required this.repository});

  @override
  Future<ExchangeRateEntity> execute(String from, String to) async {
    return await repository.getExchangeRate(from, to);
  }
}
