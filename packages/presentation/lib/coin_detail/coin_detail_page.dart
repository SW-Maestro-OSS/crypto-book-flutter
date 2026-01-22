import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/domain.dart';
import 'package:presentation/coin_detail/coin_detail_viewmodel.dart';
import 'package:presentation/coin_detail/coin_detail_state.dart';
import 'package:presentation/coin_detail/coin_detail_intent.dart';
import 'package:presentation/coin_detail/widgets/price_header.dart';
import 'package:presentation/coin_detail/widgets/metric_card.dart';
import 'package:presentation/coin_detail/widgets/price_chart_widget.dart';
import 'package:presentation/coin_detail/widgets/insight_section.dart';
import 'package:presentation/coin_detail/widgets/article_section.dart';
import 'package:presentation/core/widgets/error_handler.dart';
import 'package:presentation/core/theme/app_spacing.dart';
import 'package:presentation/core/utils/number_formatter.dart';

class CoinDetailPage extends ConsumerWidget {
  final String symbol;

  const CoinDetailPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coinDetailViewModelProvider(symbol));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(symbol),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: 옵션 메뉴
            },
          ),
        ],
      ),
      body: state.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (ticker, chartData, selectedTimeframe, isLoadingChart) =>
            SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price Header
              PriceHeader(ticker: ticker),

              const SizedBox(height: AppSpacing.xxl),

              // Price Chart
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.gridPadding,
                ),
                child: PriceChartWidget(
                  chartData: chartData,
                  selectedTimeframe: selectedTimeframe,
                  isLoading: isLoadingChart,
                  onTimeframeChanged: (timeframe) {
                    ref.read(coinDetailViewModelProvider(symbol).notifier).onIntent(
                          CoinDetailIntent.changeTimeframe(timeframe),
                        );
                  },
                ),
              ),

              const SizedBox(height: AppSpacing.xxl),

              // Metrics Grid (2x3)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.gridPadding,
                ),
                child: _buildMetricsGrid(ticker),
              ),

              const SizedBox(height: AppSpacing.sectionSpacing),

              // AI Insight (Mock data)
              InsightSection(
                insight: AiInsightEntity.mock(ticker.baseAsset),
              ),

              const SizedBox(height: AppSpacing.sectionSpacing),

              // Related Articles (Mock data)
              ArticleSection(
                articles: NewsArticleEntity.mockList(ticker.baseAsset),
              ),

              const SizedBox(height: AppSpacing.sectionSpacing),
            ],
          ),
        ),
        error: (error) => ErrorHandler(
          error: error,
          onRetry: () {
            // Reload will be triggered automatically by ViewModel
          },
        ),
      ),
    );
  }

  Widget _buildMetricsGrid(ticker) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: AppSpacing.gridSpacing,
      crossAxisSpacing: AppSpacing.gridSpacing,
      childAspectRatio: 1.5,
      children: [
        MetricCard(
          label: '24h High',
          value: '\$${NumberFormatter.formatPrice(ticker.high24h)}',
        ),
        MetricCard(
          label: '24h Low',
          value: '\$${NumberFormatter.formatPrice(ticker.low24h)}',
        ),
        MetricCard(
          label: '24h Volume',
          value: NumberFormatter.formatVolume(ticker.volume24h),
        ),
        MetricCard(
          label: 'Quote Volume',
          value: NumberFormatter.formatVolume(ticker.quoteVolume24h),
        ),
        MetricCard(
          label: 'Market Cap',
          value: 'N/A',
          subtitle: 'Coming soon',
        ),
        MetricCard(
          label: 'Circulating Supply',
          value: 'N/A',
          subtitle: 'Coming soon',
        ),
      ],
    );
  }
}

