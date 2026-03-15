import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:presentation/core/widgets/coin_icon.dart';
import 'package:presentation/theme/extensions/context_extensions.dart';

class CoinListItem extends StatelessWidget {
  final CoinTickerEntity ticker;

  const CoinListItem({
    super.key,
    required this.ticker,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = ticker.priceChangePercent24h >= 0;
    final changeColor = context.priceChangeColor(ticker.priceChangePercent24h);

    return ListTile(
      leading: CoinIcon(
        symbol: ticker.symbol,
        imageUrl: ticker.imageUrl?.isNotEmpty == true ? ticker.imageUrl : null,
        size: 40,
      ),
      title: Text(
        ticker.symbol,
        style: context.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Vol: ${_formatVolume(ticker.volume24h)}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$${_formatPrice(ticker.currentPrice)}',
            style: context.cryptoTheme.priceTextStyle,
          ),
          Text(
            '${isPositive ? '+' : ''}${ticker.priceChangePercent24h.toStringAsFixed(2)}%',
            style: context.cryptoTheme.percentChangeTextStyle
                .copyWith(color: changeColor),
          ),
        ],
      ),
    );
  }

  /// 가격 포맷 (가격에 따라 소수점 자리수 동적 조정)
  String _formatPrice(double price) {
    if (price >= 100) {
      return price.toStringAsFixed(2); // $100 이상: 2자리
    } else if (price >= 10) {
      return price.toStringAsFixed(3); // $10-100: 3자리
    } else if (price >= 1) {
      return price.toStringAsFixed(4); // $1-10: 4자리
    } else if (price >= 0.01) {
      return price.toStringAsFixed(5); // $0.01-1: 5자리
    } else {
      return price.toStringAsFixed(6); // $0.01 미만: 6자리
    }
  }

  String _formatVolume(double volume) {
    if (volume >= 1000000000) {
      return '${(volume / 1000000000).toStringAsFixed(2)}B';
    } else if (volume >= 1000000) {
      return '${(volume / 1000000).toStringAsFixed(2)}M';
    } else if (volume >= 1000) {
      return '${(volume / 1000).toStringAsFixed(2)}K';
    }
    return volume.toStringAsFixed(2);
  }
}
