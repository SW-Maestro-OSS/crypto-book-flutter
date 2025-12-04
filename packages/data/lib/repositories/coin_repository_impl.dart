import 'package:domain/domain.dart';
import 'package:data/datasources/binance_rest_data_source.dart';
import 'package:data/datasources/binance_websocket_data_source.dart';

class CoinRepositoryImpl implements CoinRepository {
  final BinanceRestDataSource restDataSource;
  final BinanceWebSocketDataSource wsDataSource;

  CoinRepositoryImpl({
    required this.restDataSource,
    required this.wsDataSource,
  });

  @override
  Future<List<CoinEntity>> getCoinList() async {
    final dtos = await restDataSource.getCoinList();
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<CoinTickerEntity>> getTickers(List<String> symbols) async {
    // TODO: 구현
    throw UnimplementedError();
  }

  @override
  Stream<CoinTickerEntity> subscribeToTicker(String symbol) {
    // TODO: 구현
    throw UnimplementedError();
  }

  @override
  Stream<List<CoinTickerEntity>> subscribeToTickers(List<String> symbols) {
    // TODO: 구현
    throw UnimplementedError();
  }
}
