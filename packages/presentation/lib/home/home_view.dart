import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/home/home_viewmodel.dart';
import 'package:presentation/home/home_state.dart';
import 'package:presentation/home/home_intent.dart';
import 'package:presentation/home/widgets/coin_list_item.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).onIntent(const HomeIntent.load());
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (allTickers, displayedTickers, displayCount, sortType, isAscending) {
        return Column(
          children: [
            AppBar(
              title: const Text('Crypto Tracker'),
            ),
            _buildSortHeader(sortType, isAscending),
            Expanded(
              child: ListView.builder(
                itemCount: displayedTickers.length,
                itemBuilder: (context, index) {
                  final ticker = displayedTickers[index];
                  return InkWell(
                    onTap: () => context.go('/coin/${ticker.symbol}'),
                    child: CoinListItem(ticker: ticker),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 16),
            Text(message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(homeViewModelProvider.notifier).onIntent(
                  const HomeIntent.load(),
                );
              },
              child: const Text('재시도'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortHeader(SortType currentSort, bool isAscending) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          _buildSortTab('Symbol', SortType.symbol, currentSort, isAscending),
          _buildSortTab('Price (\$)', SortType.price, currentSort, isAscending),
          _buildSortTab('24h Change %', SortType.changePercent, currentSort, isAscending),
        ],
      ),
    );
  }

  Widget _buildSortTab(
    String label,
    SortType type,
    SortType currentSort,
    bool isAscending,
  ) {
    final isActive = currentSort == type;

    return Expanded(
      child: InkWell(
        onTap: () {
          if (isActive) {
            ref.read(homeViewModelProvider.notifier).onIntent(
              const HomeIntent.toggleSortOrder(),
            );
          } else {
            ref.read(homeViewModelProvider.notifier).onIntent(
              HomeIntent.sort(type),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              isActive
                  ? (isAscending ? Icons.arrow_upward : Icons.arrow_downward)
                  : Icons.unfold_more,
              size: 16,
              color: isActive ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
