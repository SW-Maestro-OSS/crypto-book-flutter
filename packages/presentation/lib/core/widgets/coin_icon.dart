import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Widget that displays a cryptocurrency icon
///
/// Features:
/// - Loads icon from CDN with caching
/// - Auto-generates icon URL from symbol when imageUrl is not provided
/// - Fallback to first letter of symbol on colored background
/// - Shimmer loading effect
/// - Error handling with fallback
class CoinIcon extends StatelessWidget {
  final String symbol;
  final String? imageUrl;
  final double size;

  static const String _cdnBaseUrl =
      'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/32/icon';

  static const List<String> _quoteCurrencies = [
    'FDUSD', 'BUSD', 'USDT', 'USDC', 'TUSD', 'BIDR',
    'BTC', 'ETH', 'BNB', 'DAI',
    'EUR', 'GBP', 'TRY', 'BRL',
  ];

  const CoinIcon({
    super.key,
    required this.symbol,
    this.imageUrl,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    final url = imageUrl ?? _generateIconUrl(symbol);
    return SizedBox(
      width: size,
      height: size,
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: size / 2,
          backgroundImage: imageProvider,
          backgroundColor: Colors.transparent,
        ),
        placeholder: (context, url) => _buildShimmer(),
        errorWidget: (context, url, error) => _buildFallback(),
      ),
    );
  }

  static String _generateIconUrl(String symbol) {
    final base = _extractBaseCurrency(symbol).toLowerCase();
    return '$_cdnBaseUrl/$base.png';
  }

  static String _extractBaseCurrency(String symbol) {
    for (final quote in _quoteCurrencies) {
      if (symbol.endsWith(quote) && symbol.length > quote.length) {
        return symbol.substring(0, symbol.length - quote.length);
      }
    }
    return symbol;
  }

  /// Shimmer loading effect
  Widget _buildShimmer() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
          width: size * 0.5,
          height: size * 0.5,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildFallback() {
    final firstLetter = symbol.isNotEmpty ? symbol[0].toUpperCase() : '?';
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: _getColorForSymbol(symbol),
      child: Text(
        firstLetter,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Generate consistent color for symbol (for fallback background)
  Color _getColorForSymbol(String symbol) {
    // Use symbol hashcode to generate consistent color
    final hash = symbol.hashCode;
    final hue = (hash % 360).toDouble();
    return HSLColor.fromAHSL(1.0, hue, 0.6, 0.5).toColor();
  }
}
