import 'package:dio/dio.dart';
import 'package:data/dto/coin_dto.dart';
import 'package:data/dto/ticker_dto.dart';

/// 바이낸스 REST API DataSource
class BinanceRestDataSource {
  final String baseUrl;
  late final Dio _dio;

  BinanceRestDataSource({required this.baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
  }

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

  /// K-Line/Candlestick 데이터 조회 (차트용)
  ///
  /// [symbol]: 거래쌍 심볼 (예: BTCUSDT)
  /// [interval]: 시간 간격 (1m, 5m, 1h, 1d, 1w, 1M)
  /// [limit]: 조회할 데이터 개수 (최대 1000)
  Future<List<List<dynamic>>> fetchKlines({
    required String symbol,
    required String interval,
    int limit = 100,
  }) async {
    try {
      final response = await _dio.get(
        '/api/v3/klines',
        queryParameters: {
          'symbol': symbol,
          'interval': interval,
          'limit': limit,
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return List<List<dynamic>>.from(response.data);
      }

      throw Exception('Failed to fetch klines: ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to fetch klines: $e');
    }
  }
}
