import 'package:flutter/material.dart';
import 'package:domain/domain.dart';

class CoinListItem extends StatelessWidget {
  final CoinTickerEntity ticker;

  const CoinListItem({
    super.key,
    required this.ticker,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = ticker.priceChangePercent24h >= 0;
    final changeColor = isPositive ? Colors.green : Colors.red;

    return ListTile(
      leading: _buildCoinImage(),
      title: Text(
        ticker.symbol,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Vol: ${_formatVolume(ticker.volume24h)}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$${ticker.currentPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${isPositive ? '+' : ''}${ticker.priceChangePercent24h.toStringAsFixed(2)}%',
            style: TextStyle(
              color: changeColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// 코인 이미지 (이미지 URL이 있으면 표시, 없으면 placeholder)
  Widget _buildCoinImage() {
    if (ticker.imageUrl != null && ticker.imageUrl!.isNotEmpty) {
      return CircleAvatar(
        backgroundImage: NetworkImage(ticker.imageUrl!),
        backgroundColor: Colors.grey.shade200,
        onBackgroundImageError: (_, __) {
          // 이미지 로드 실패시 placeholder 표시
        },
      );
    }

    // Placeholder 이미지
    return CircleAvatar(
      backgroundColor: Colors.orange.shade100,
      child: Text(
        ticker.symbol.substring(0, 1),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    );
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
