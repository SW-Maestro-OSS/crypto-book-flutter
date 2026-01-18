import 'package:domain/services/coin_icon_service.dart';

/// Implementation of CoinIconService using GitHub cryptocurrency icons CDN
class CoinIconServiceImpl implements CoinIconService {
  static const String _baseUrl =
      'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/32/icon';

  @override
  String getIconUrl(String symbol) {
    // Extract base currency from trading pair (e.g., BTCUSDT -> btc)
    final base = _extractBaseCurrency(symbol).toLowerCase();
    return '$_baseUrl/$base.png';
  }

  /// Extract base currency from symbol
  /// Examples:
  /// - BTCUSDT -> BTC
  /// - ETHUSDT -> ETH
  /// - BTC -> BTC (already base)
  String _extractBaseCurrency(String symbol) {
    // Remove common quote currencies
    final quoteCurrencies = ['USDT', 'BUSD', 'USDC', 'BTC', 'ETH', 'BNB'];

    for (final quote in quoteCurrencies) {
      if (symbol.endsWith(quote) && symbol.length > quote.length) {
        return symbol.substring(0, symbol.length - quote.length);
      }
    }

    // If no quote currency found, return symbol as-is
    return symbol;
  }
}
