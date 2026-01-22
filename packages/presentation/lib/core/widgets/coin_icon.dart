import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Widget that displays a cryptocurrency icon
///
/// Features:
/// - Loads icon from CDN with caching
/// - Fallback to first letter of symbol on colored background
/// - Shimmer loading effect
/// - Error handling with fallback
class CoinIcon extends StatelessWidget {
  final String symbol;
  final String? imageUrl;
  final double size;

  const CoinIcon({
    super.key,
    required this.symbol,
    this.imageUrl,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: _getColorForSymbol(symbol),
      child: imageUrl != null
          ? ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                placeholder: (context, url) => _buildShimmer(),
                errorWidget: (context, url, error) => _buildFallback(),
              ),
            )
          : _buildFallback(),
    );
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

  /// Fallback: First letter of symbol on colored background
  Widget _buildFallback() {
    final firstLetter = symbol.isNotEmpty ? symbol[0].toUpperCase() : '?';
    return Text(
      firstLetter,
      style: TextStyle(
        color: Colors.white,
        fontSize: size * 0.5,
        fontWeight: FontWeight.bold,
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
