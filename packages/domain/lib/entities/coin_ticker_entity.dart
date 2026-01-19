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

  /// Extract base asset from symbol (e.g., "BTCUSDT" -> "BTC")
  static String extractBaseAsset(String symbol) {
    // Remove common quote assets
    if (symbol.endsWith('USDT')) {
      return symbol.substring(0, symbol.length - 4);
    } else if (symbol.endsWith('BUSD')) {
      return symbol.substring(0, symbol.length - 4);
    } else if (symbol.endsWith('BTC')) {
      return symbol.substring(0, symbol.length - 3);
    } else if (symbol.endsWith('ETH')) {
      return symbol.substring(0, symbol.length - 3);
    }
    return symbol;
  }

  /// Extract quote asset from symbol (e.g., "BTCUSDT" -> "USDT")
  static String extractQuoteAsset(String symbol) {
    if (symbol.endsWith('USDT')) {
      return 'USDT';
    } else if (symbol.endsWith('BUSD')) {
      return 'BUSD';
    } else if (symbol.endsWith('BTC')) {
      return 'BTC';
    } else if (symbol.endsWith('ETH')) {
      return 'ETH';
    }
    return 'USDT'; // Default to USDT
  }

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
