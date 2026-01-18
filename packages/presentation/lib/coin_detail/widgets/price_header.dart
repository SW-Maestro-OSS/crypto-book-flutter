import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:presentation/core/widgets/coin_icon.dart';
import 'package:presentation/coin_detail/widgets/price_change_indicator.dart';

/// Header widget that displays coin icon, name, current price, and change
class PriceHeader extends StatelessWidget {
  final CoinTickerEntity ticker;

  const PriceHeader({
    super.key,
    required this.ticker,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoinIcon(
            symbol: ticker.symbol,
            imageUrl: ticker.imageUrl,
            size: 56,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getCoinName(ticker.symbol),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ticker.symbol,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '\$${ticker.currentPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                PriceChangeIndicator(
                  changePercent: ticker.priceChangePercent24h,
                  changeAmount: ticker.priceChange24h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Extract coin name from symbol (simplified)
  String _getCoinName(String symbol) {
    // Remove USDT suffix
    final base = symbol.replaceAll('USDT', '');

    // Map common symbols to names
    const nameMap = {
      'BTC': 'Bitcoin',
      'ETH': 'Ethereum',
      'BNB': 'Binance Coin',
      'SOL': 'Solana',
      'ADA': 'Cardano',
      'XRP': 'Ripple',
      'DOT': 'Polkadot',
      'DOGE': 'Dogecoin',
      'AVAX': 'Avalanche',
      'MATIC': 'Polygon',
    };

    return nameMap[base] ?? base;
  }
}
