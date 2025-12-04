/// 코인 기본 정보
class CoinEntity {
  final String symbol;        // 예: BTCUSDT
  final String baseAsset;     // 예: BTC
  final String quoteAsset;    // 예: USDT

  const CoinEntity({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CoinEntity && other.symbol == symbol;
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  String toString() => 'CoinEntity(symbol: $symbol, baseAsset: $baseAsset, quoteAsset: $quoteAsset)';
}
