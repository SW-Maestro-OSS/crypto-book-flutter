import 'package:domain/entities/coin_ticker_entity.dart';
import 'package:domain/repositories/coin_repository.dart';

/// 실시간 코인 시세 구독 UseCase
abstract interface class SubscribeCoinTickerUseCase {
  Stream<List<CoinTickerEntity>> execute(List<String> symbols);
}

class SubscribeCoinTickerUseCaseImpl implements SubscribeCoinTickerUseCase {
  final CoinRepository repository;

  SubscribeCoinTickerUseCaseImpl({required this.repository});

  @override
  Stream<List<CoinTickerEntity>> execute(List<String> symbols) {
    return repository.subscribeToTickers(symbols);
  }
}
