import 'package:domain/entities/coin_entity.dart';
import 'package:domain/repositories/coin_repository.dart';

/// 코인 목록 조회 UseCase
abstract interface class GetCoinListUseCase {
  Future<List<CoinEntity>> execute();
}

class GetCoinListUseCaseImpl implements GetCoinListUseCase {
  final CoinRepository repository;

  GetCoinListUseCaseImpl({required this.repository});

  @override
  Future<List<CoinEntity>> execute() async {
    return await repository.getCoinList();
  }
}
