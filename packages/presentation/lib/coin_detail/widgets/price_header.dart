import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/domain.dart';
import 'package:presentation/core/widgets/coin_icon.dart';
import 'package:presentation/coin_detail/widgets/price_change_indicator.dart';
import 'package:presentation/core/utils/price_formatter.dart';
import 'package:presentation/providers/app_settings_provider.dart';

/// Header widget that displays coin icon, name, current price, and change
class PriceHeader extends ConsumerWidget {
  final CoinTickerEntity ticker;

  const PriceHeader({
    super.key,
    required this.ticker,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get global settings
    final appSettings = ref.watch(appSettingsProvider);
    final currency = appSettings.currency;
    final exchangeRate = appSettings.exchangeRate;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoinIcon(
            symbol: ticker.baseAsset,
            imageUrl: ticker.imageUrl,
            size: 56,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getCoinName(ticker.baseAsset),
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
                  PriceFormatter.format(
                    priceInUSD: ticker.currentPrice,
                    currency: currency,
                    exchangeRate: exchangeRate,
                  ),
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

  /// Get coin name from base asset (simplified)
  String _getCoinName(String baseAsset) {
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
      'LTC': 'Litecoin',
      'LINK': 'Chainlink',
      'UNI': 'Uniswap',
      'ATOM': 'Cosmos',
    };

    return nameMap[baseAsset] ?? baseAsset;
  }
}
