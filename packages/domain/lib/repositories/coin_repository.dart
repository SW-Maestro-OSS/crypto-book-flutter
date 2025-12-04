import 'package:domain/entities/coin_entity.dart';
import 'package:domain/entities/coin_ticker_entity.dart';

/// 코인 데이터 Repository 인터페이스
abstract interface class CoinRepository {
  /// 모든 코인 목록 조회
  Future<List<CoinEntity>> getCoinList();

  /// 특정 코인들의 시세 조회
  Future<List<CoinTickerEntity>> getTickers(List<String> symbols);

  /// 실시간 시세 구독 (WebSocket)
  Stream<CoinTickerEntity> subscribeToTicker(String symbol);

  /// 여러 코인 실시간 시세 구독
  Stream<List<CoinTickerEntity>> subscribeToTickers(List<String> symbols);
}
