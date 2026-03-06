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
    // Remove common quote assets (check longer strings first)
    if (symbol.endsWith('USDT')) {
      return symbol.substring(0, symbol.length - 4);
    } else if (symbol.endsWith('USDC')) {
      return symbol.substring(0, symbol.length - 4);
    } else if (symbol.endsWith('BUSD')) {
      return symbol.substring(0, symbol.length - 4);
    } else if (symbol.endsWith('USD')) {
      return symbol.substring(0, symbol.length - 3);
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
    } else if (symbol.endsWith('USDC')) {
      return 'USDC';
    } else if (symbol.endsWith('BUSD')) {
      return 'BUSD';
    } else if (symbol.endsWith('BTC')) {
      return 'BTC';
    } else if (symbol.endsWith('ETH')) {
      return 'ETH';
    } else if (symbol.endsWith('USD')) {
      return 'USD';
    }
    return 'UNKNOWN'; // Changed from USDT to UNKNOWN
  }

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
