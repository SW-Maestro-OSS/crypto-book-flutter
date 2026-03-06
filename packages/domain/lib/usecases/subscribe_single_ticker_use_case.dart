import 'package:domain/entities/coin_ticker_entity.dart';
import 'package:domain/repositories/coin_repository.dart';

/// Single symbol real-time ticker subscription UseCase
abstract interface class SubscribeSingleTickerUseCase {
  Stream<CoinTickerEntity> execute(String symbol);
}

class SubscribeSingleTickerUseCaseImpl implements SubscribeSingleTickerUseCase {
  final CoinRepository repository;

  SubscribeSingleTickerUseCaseImpl({required this.repository});

  @override
  Stream<CoinTickerEntity> execute(String symbol) {
    return repository.subscribeToTicker(symbol);
  }
}
