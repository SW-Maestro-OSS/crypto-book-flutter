/// Service for getting cryptocurrency icon URLs
abstract interface class CoinIconService {
  /// Get icon URL for a given symbol
  /// Example: BTCUSDT -> returns BTC icon URL
  String getIconUrl(String symbol);
}
