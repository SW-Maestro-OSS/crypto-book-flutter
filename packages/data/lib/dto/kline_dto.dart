import 'package:domain/domain.dart';

/// Kline/Candlestick DTO
///
/// Binance API klines response format:
/// [
///   openTime,
///   open,
///   high,
///   low,
///   close,
///   volume,
///   closeTime,
///   quoteAssetVolume,
///   numberOfTrades,
///   takerBuyBaseAssetVolume,
///   takerBuyQuoteAssetVolume,
///   ignore
/// ]
class KlineDTO {
  final int openTime;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;
  final int closeTime;

  KlineDTO({
    required this.openTime,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.closeTime,
  });

  /// Parse from Binance API array response
  factory KlineDTO.fromList(List<dynamic> data) {
    return KlineDTO(
      openTime: data[0] is int ? data[0] : int.parse(data[0].toString()),
      open: double.parse(data[1].toString()),
      high: double.parse(data[2].toString()),
      low: double.parse(data[3].toString()),
      close: double.parse(data[4].toString()),
      volume: double.parse(data[5].toString()),
      closeTime: data[6] is int ? data[6] : int.parse(data[6].toString()),
    );
  }

  /// Convert to ChartDataPoint (using close price)
  ChartDataPoint toChartDataPoint() {
    return ChartDataPoint(
      timestamp: DateTime.fromMillisecondsSinceEpoch(openTime),
      price: close,
    );
  }
}
