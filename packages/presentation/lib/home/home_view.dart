import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/home/home_viewmodel.dart';
import 'package:presentation/home/home_state.dart';
import 'package:presentation/home/home_intent.dart';
import 'package:presentation/home/widgets/coin_list_item.dart';
import 'package:presentation/theme/extensions/context_extensions.dart';
import 'package:presentation/theme/spacing/app_spacing.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(homeViewModelProvider.notifier)
          .onIntent(const HomeIntent.load());
    });

    // 스크롤 리스너 추가 (페이징 처리)
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      // 스크롤이 80% 이상 내려갔을 때 더 로드
      ref
          .read(homeViewModelProvider.notifier)
          .onIntent(const HomeIntent.loadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded:
          (allTickers, displayedTickers, displayCount, sortType, isAscending) {
        return Column(
          children: [
            _buildSortHeader(sortType, isAscending),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: displayedTickers.length + 1,
                itemBuilder: (context, index) {
                  // 더보기 인디케이터
                  if (index == displayedTickers.length) {
                    return displayCount < 30
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Builder(
                                builder: (context) => Text(
                                  'Scroll down for more...',
                                  style: TextStyle(
                                    color: context.colorScheme.onSurface
                                        .withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  }

                  final ticker = displayedTickers[index];
                  return InkWell(
                    onTap: () => context.push('/coin/${ticker.symbol}'),
                    child: CoinListItem(ticker: ticker),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: (message) => Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline,
                  size: 80, color: context.colorScheme.error),
              SizedBox(height: AppSpacing.md),
              Text(message),
              SizedBox(height: AppSpacing.md),
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
      ),
    );
  }

  Widget _buildSortHeader(SortType currentSort, bool isAscending) {
    return Container(
      padding: AppSpacing.allMd,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          bottom:
              BorderSide(color: context.colorScheme.outline.withOpacity(0.3)),
        ),
      ),
      child: Row(
        children: [
          _buildSortTab('Symbol', SortType.symbol, currentSort, isAscending),
          _buildSortTab('Price (\$)', SortType.price, currentSort, isAscending),
          _buildSortTab(
              '24h Change %', SortType.changePercent, currentSort, isAscending),
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
            Builder(
              builder: (context) => Icon(
                isActive
                    ? (isAscending ? Icons.arrow_upward : Icons.arrow_downward)
                    : Icons.unfold_more,
                size: 16,
                color: isActive
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
