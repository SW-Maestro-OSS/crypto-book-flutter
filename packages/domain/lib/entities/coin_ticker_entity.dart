/// 코인 시세 정보 (24시간 변동 포함)
class CoinTickerEntity {
  final String symbol;
  final String baseAsset;   // e.g., "BTC" from "BTCUSDT"
  final String quoteAsset;  // e.g., "USDT" from "BTCUSDT"
  final double currentPrice;
  final double priceChange24h;
  final double priceChangePercent24h;
  final double high24h;
  final double low24h;
  final double volume24h;
  final double quoteVolume24h;  // Total traded quote asset volume
  final DateTime timestamp;
  final String? imageUrl;

  const CoinTickerEntity({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.currentPrice,
    required this.priceChange24h,
    required this.priceChangePercent24h,
    required this.high24h,
    required this.low24h,
    required this.volume24h,
    required this.quoteVolume24h,
    required this.timestamp,
    this.imageUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CoinTickerEntity &&
        other.symbol == symbol &&
        other.currentPrice == currentPrice &&
        other.priceChange24h == priceChange24h &&
        other.priceChangePercent24h == priceChangePercent24h &&
        other.high24h == high24h &&
        other.low24h == low24h &&
        other.volume24h == volume24h &&
        other.quoteVolume24h == quoteVolume24h;
  }

  @override
  int get hashCode => Object.hash(
        symbol,
        currentPrice,
        priceChangePercent24h,
        volume24h,
      );

  @override
  String toString() => 'CoinTickerEntity(symbol: $symbol, price: $currentPrice, change: $priceChangePercent24h%)';
}
