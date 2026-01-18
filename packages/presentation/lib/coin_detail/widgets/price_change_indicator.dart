import 'package:flutter/material.dart';

/// Widget that displays price change with color-coded indicators
///
/// Matches Figma: Property 1=Up/Down/Flat components
/// - Green with up arrow for positive changes
/// - Red with down arrow for negative changes
/// - Gray for no change
class PriceChangeIndicator extends StatelessWidget {
  final double changePercent;
  final double changeAmount;
  final TextStyle? textStyle;

  const PriceChangeIndicator({
    super.key,
    required this.changePercent,
    required this.changeAmount,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = changePercent > 0;
    final isNegative = changePercent < 0;
    final color = isPositive
        ? const Color(0xFF00C853) // Green
        : isNegative
            ? const Color(0xFFFF5252) // Red
            : Colors.grey;

    final icon = isPositive
        ? Icons.arrow_upward
        : isNegative
            ? Icons.arrow_downward
            : Icons.remove;

    final percentText = '${isPositive ? '+' : ''}${changePercent.toStringAsFixed(2)}%';
    final amountText = '${isPositive ? '+' : ''}${changeAmount.toStringAsFixed(2)}';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          '$percentText ($amountText)',
          style: (textStyle ?? const TextStyle(fontSize: 14)).copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
