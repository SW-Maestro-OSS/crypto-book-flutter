import 'package:intl/intl.dart';
import 'package:domain/domain.dart';
import 'number_formatter.dart';

/// Price formatter utility for displaying prices in different currencies
class PriceFormatter {
  PriceFormatter._();

  /// Format price with appropriate currency symbol and conversion
  ///
  /// [priceInUSD]: Price in US Dollars
  /// [currency]: Target currency (USD, KRW, etc.)
  /// [exchangeRate]: Exchange rate entity (optional, required for non-USD currencies)
  static String format({
    required double priceInUSD,
    required String currency,
    ExchangeRateEntity? exchangeRate,
  }) {
    switch (currency) {
      case 'USD':
        return _formatUSD(priceInUSD);
      case 'KRW':
        return _formatKRW(priceInUSD, exchangeRate);
      default:
        return _formatUSD(priceInUSD);
    }
  }

  /// Format price in USD
  static String _formatUSD(double price) {
    return '\$${NumberFormatter.formatPrice(price)}';
  }

  /// Format price in KRW
  static String _formatKRW(double priceInUSD, ExchangeRateEntity? exchangeRate) {
    if (exchangeRate == null || exchangeRate.fromCurrency != 'USD' || exchangeRate.toCurrency != 'KRW') {
      // Fallback to USD if exchange rate not available
      return _formatUSD(priceInUSD);
    }

    final priceInKRW = priceInUSD * exchangeRate.rate;
    final formatter = NumberFormat('#,###', 'ko_KR');

    if (priceInKRW >= 1) {
      return '₩${formatter.format(priceInKRW.toInt())}';
    } else {
      // For very small amounts, show decimal places
      return '₩${priceInKRW.toStringAsFixed(2)}';
    }
  }

  /// Format volume/market cap with $ prefix and abbreviations (K, M, B, T)
  static String formatLargeNumber(double number) {
    return '\$${NumberFormatter.formatVolume(number)}';
  }

  /// Format percentage change
  static String formatPercentChange(double percent) {
    final sign = percent >= 0 ? '+' : '';
    return '$sign${percent.toStringAsFixed(2)}%';
  }
}
