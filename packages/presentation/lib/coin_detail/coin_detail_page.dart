import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinDetailPage extends ConsumerWidget {
  final String symbol;

  const CoinDetailPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symbol),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              symbol,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            const Text('TODO: 코인 상세 정보 구현'),
            const SizedBox(height: 8),
            const Text('- 실시간 가격'),
            const Text('- 가격 차트'),
            const Text('- 거래 내역'),
          ],
        ),
      ),
    );
  }
}
