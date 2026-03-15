/// Symbol parsing extension for trading pair strings (e.g., "BTCUSDT")
extension SymbolParsing on String {
  /// Extract base asset from symbol (e.g., "BTCUSDT" -> "BTC")
  String get baseAsset {
    if (endsWith('USDT')) {
      return substring(0, length - 4);
    } else if (endsWith('USDC')) {
      return substring(0, length - 4);
    } else if (endsWith('BUSD')) {
      return substring(0, length - 4);
    } else if (endsWith('USD')) {
      return substring(0, length - 3);
    } else if (endsWith('BTC')) {
      return substring(0, length - 3);
    } else if (endsWith('ETH')) {
      return substring(0, length - 3);
    }
    return this;
  }

  /// Extract quote asset from symbol (e.g., "BTCUSDT" -> "USDT")
  String get quoteAsset {
    if (endsWith('USDT')) {
      return 'USDT';
    } else if (endsWith('USDC')) {
      return 'USDC';
    } else if (endsWith('BUSD')) {
      return 'BUSD';
    } else if (endsWith('BTC')) {
      return 'BTC';
    } else if (endsWith('ETH')) {
      return 'ETH';
    } else if (endsWith('USD')) {
      return 'USD';
    }
    return 'UNKNOWN';
  }
}
