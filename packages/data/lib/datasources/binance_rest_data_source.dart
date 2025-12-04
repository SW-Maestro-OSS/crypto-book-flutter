import 'package:data/dto/coin_dto.dart';
import 'package:data/dto/ticker_dto.dart';

/// 바이낸스 REST API DataSource (구조만 준비)
class BinanceRestDataSource {
  final String baseUrl;

  BinanceRestDataSource({required this.baseUrl});

  /// 코인 목록 조회
  Future<List<CoinDTO>> getCoinList() async {
    // TODO: 실제 API 호출 구현
    // 임시로 더미 데이터 반환
    return [
      CoinDTO(symbol: 'BTCUSDT', baseAsset: 'BTC', quoteAsset: 'USDT'),
      CoinDTO(symbol: 'ETHUSDT', baseAsset: 'ETH', quoteAsset: 'USDT'),
      CoinDTO(symbol: 'BNBUSDT', baseAsset: 'BNB', quoteAsset: 'USDT'),
      CoinDTO(symbol: 'ADAUSDT', baseAsset: 'ADA', quoteAsset: 'USDT'),
      CoinDTO(symbol: 'SOLUSDT', baseAsset: 'SOL', quoteAsset: 'USDT'),
    ];
  }

  /// 24시간 티커 조회
  Future<List<TickerDTO>> get24hTickers() async {
    // TODO: 실제 API 호출 구현
    throw UnimplementedError('REST API not implemented yet');
  }
}
