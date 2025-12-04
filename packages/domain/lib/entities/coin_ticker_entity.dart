/// 코인 시세 정보 (24시간 변동 포함)
class CoinTickerEntity {
  final String symbol;
  final double currentPrice;
  final double priceChange24h;
  final double priceChangePercent24h;
  final double high24h;
  final double low24h;
  final double volume24h;
  final DateTime timestamp;
  final String? imageUrl;

  const CoinTickerEntity({
    required this.symbol,
    required this.currentPrice,
    required this.priceChange24h,
    required this.priceChangePercent24h,
    required this.high24h,
    required this.low24h,
    required this.volume24h,
    required this.timestamp,
    this.imageUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CoinTickerEntity && other.symbol == symbol;
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  String toString() => 'CoinTickerEntity(symbol: $symbol, price: $currentPrice, change: $priceChangePercent24h%)';
}
