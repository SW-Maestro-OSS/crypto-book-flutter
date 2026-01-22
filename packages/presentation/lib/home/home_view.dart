import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/domain.dart';
import 'package:presentation/home/home_viewmodel.dart';
import 'package:presentation/home/home_state.dart';
import 'package:presentation/home/home_intent.dart';
import 'package:presentation/home/widgets/search_bar_widget.dart';
import 'package:presentation/home/widgets/sort_header.dart';
import 'package:presentation/home/widgets/price_row.dart';
import 'package:presentation/main/main_viewmodel.dart';
import 'package:presentation/core/widgets/error_handler.dart';
import 'package:presentation/core/theme/app_spacing.dart';
import 'package:presentation/core/theme/app_colors.dart';
import 'package:presentation/core/theme/app_typography.dart';

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
      loaded: (
        allTickers,
        displayedTickers,
        displayCount,
        sortType,
        isAscending,
        searchQuery,
      ) {
        return Column(
          children: [
            // Search Bar
            SearchBarWidget(
              value: searchQuery,
              onChanged: (query) {
                ref.read(homeViewModelProvider.notifier).onIntent(
                      HomeIntent.search(query),
                    );
              },
              hintText: 'Search coins...',
            ),

            // Sort Header
            SortHeader(
              currentSortType: sortType,
              isAscending: isAscending,
              onSortChanged: (newSortType) {
                ref.read(homeViewModelProvider.notifier).onIntent(
                      HomeIntent.sort(newSortType),
                    );
              },
            ),

            // Coin List
            Expanded(
              child: displayedTickers.isEmpty
                  ? _buildEmptyState(searchQuery)
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: displayedTickers.length + 1,
                      itemBuilder: (context, index) {
                        // 더보기 인디케이터
                        if (index == displayedTickers.length) {
                          return displayCount < 30
                              ? Padding(
                                  padding: const EdgeInsets.all(
                                      AppSpacing.sectionPadding),
                                  child: Center(
                                    child: Text(
                                      'Scroll down for more...',
                                      style: AppTypography.bodySmall,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink();
                        }

                        final ticker = displayedTickers[index];
                        return PriceRow(
                          ticker: ticker,
                          onTap: () {
                            ref.read(routingHelperProvider).pushTo(
                                  PageType.coinDetail,
                                  pathParams: {'symbol': ticker.symbol},
                                );
                          },
                        );
                      },
                    ),
            ),
          ],
        );
      },
      error: (appError) => ErrorHandler(
        error: appError,
        onRetry: () {
          ref.read(homeViewModelProvider.notifier).onIntent(
                const HomeIntent.load(),
              );
        },
      ),
    );
  }

  Widget _buildEmptyState(String searchQuery) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sectionPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: AppSpacing.iconXl * 2,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'No coins found',
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            if (searchQuery.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Try searching for "${searchQuery.toUpperCase()}"',
                style: AppTypography.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
