import 'package:intl/intl.dart';

/// Number formatting utility for various numeric displays
class NumberFormatter {
  NumberFormatter._();

  /// Format price with dynamic decimal places based on value
  static String formatPrice(double price) {
    if (price >= 100) {
      return price.toStringAsFixed(2);  // $100+: 2 decimal places
    } else if (price >= 10) {
      return price.toStringAsFixed(3);  // $10-100: 3 decimal places
    } else if (price >= 1) {
      return price.toStringAsFixed(4);  // $1-10: 4 decimal places
    } else if (price >= 0.01) {
      return price.toStringAsFixed(5);  // $0.01-1: 5 decimal places
    } else {
      return price.toStringAsFixed(6);  // <$0.01: 6 decimal places
    }
  }

  /// Format volume with K/M/B/T abbreviations
  static String formatVolume(double volume) {
    if (volume >= 1000000000000) {
      return '${(volume / 1000000000000).toStringAsFixed(2)}T';
    } else if (volume >= 1000000000) {
      return '${(volume / 1000000000).toStringAsFixed(2)}B';
    } else if (volume >= 1000000) {
      return '${(volume / 1000000).toStringAsFixed(2)}M';
    } else if (volume >= 1000) {
      return '${(volume / 1000).toStringAsFixed(2)}K';
    } else {
      return volume.toStringAsFixed(2);
    }
  }

  /// Format market cap with K/M/B/T abbreviations
  static String formatMarketCap(double marketCap) {
    if (marketCap >= 1000000000000) {
      return '\$${(marketCap / 1000000000000).toStringAsFixed(2)}T';
    } else if (marketCap >= 1000000000) {
      return '\$${(marketCap / 1000000000).toStringAsFixed(2)}B';
    } else if (marketCap >= 1000000) {
      return '\$${(marketCap / 1000000).toStringAsFixed(2)}M';
    } else if (marketCap >= 1000) {
      return '\$${(marketCap / 1000).toStringAsFixed(2)}K';
    } else {
      return '\$${marketCap.toStringAsFixed(2)}';
    }
  }

  /// Format percentage with sign
  static String formatPercent(double percent) {
    final sign = percent >= 0 ? '+' : '';
    return '$sign${percent.toStringAsFixed(2)}%';
  }

  /// Format large number with commas
  static String formatWithCommas(double number) {
    final formatter = NumberFormat('#,###.##');
    return formatter.format(number);
  }

  /// Format crypto amount (e.g., 0.00123456 BTC)
  static String formatCryptoAmount(double amount) {
    if (amount >= 1) {
      return amount.toStringAsFixed(8);
    } else {
      return amount.toStringAsFixed(8);
    }
  }
}
