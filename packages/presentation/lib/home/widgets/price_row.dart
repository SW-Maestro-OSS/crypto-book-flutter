import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/coin_icon.dart';

class PriceRow extends StatelessWidget {
  final CoinTickerEntity ticker;
  final VoidCallback? onTap;

  const PriceRow({
    super.key,
    required this.ticker,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final changePercent = ticker.priceChangePercent24h;
    final changeColor = AppColors.getPriceChangeColor(changePercent);
    final badgeBackground = AppColors.getBadgeBackgroundColor(changePercent);

    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSpacing.priceRowHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.priceRowPadding,
          vertical: AppSpacing.priceRowPaddingVertical,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.borderLight,
              width: AppSpacing.borderWidthThin,
            ),
          ),
        ),
        child: Row(
          children: [
            // Coin Icon
            CoinIcon(
              symbol: ticker.baseAsset,
              imageUrl: ticker.imageUrl,
              size: AppSpacing.coinIconMedium,
            ),
            const SizedBox(width: AppSpacing.md),

            // Symbol and Coin Name
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticker.baseAsset,
                    style: AppTypography.symbolMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    _getCoinName(ticker.baseAsset),
                    style: AppTypography.coinName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Price and Change Percent
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${_formatPrice(ticker.currentPrice)}',
                    style: AppTypography.priceMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.badgePaddingHorizontal,
                      // vertical: AppSpacing.badgePaddingVertical,
                    ),
                    decoration: BoxDecoration(
                      color: badgeBackground,
                      borderRadius:
                          BorderRadius.circular(AppSpacing.badgeRadius),
                    ),
                    child: AutoSizeText(
                      '${changePercent >= 0 ? '+' : ''}${changePercent.toStringAsFixed(2)}%',
                      style: AppTypography.changePercentMedium.copyWith(
                        color: changeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get coin name from base asset (placeholder, will be replaced with actual data later)
  String _getCoinName(String baseAsset) {
    // Simple mapping for common coins
    const coinNames = {
      'BTC': 'Bitcoin',
      'ETH': 'Ethereum',
      'BNB': 'Binance Coin',
      'XRP': 'Ripple',
      'ADA': 'Cardano',
      'DOGE': 'Dogecoin',
      'SOL': 'Solana',
      'DOT': 'Polkadot',
      'MATIC': 'Polygon',
      'LTC': 'Litecoin',
      'AVAX': 'Avalanche',
      'LINK': 'Chainlink',
      'UNI': 'Uniswap',
      'ATOM': 'Cosmos',
      'XLM': 'Stellar',
      'ALGO': 'Algorand',
      'VET': 'VeChain',
      'FIL': 'Filecoin',
      'TRX': 'TRON',
      'ETC': 'Ethereum Classic',
    };

    return coinNames[baseAsset] ?? baseAsset;
  }

  /// Format price based on value (dynamic decimal places)
  String _formatPrice(double price) {
    if (price >= 100) {
      return price.toStringAsFixed(2); // $100+: 2 decimal places
    } else if (price >= 10) {
      return price.toStringAsFixed(3); // $10-100: 3 decimal places
    } else if (price >= 1) {
      return price.toStringAsFixed(4); // $1-10: 4 decimal places
    } else if (price >= 0.01) {
      return price.toStringAsFixed(5); // $0.01-1: 5 decimal places
    } else {
      return price.toStringAsFixed(6); // <$0.01: 6 decimal places
    }
  }
}
