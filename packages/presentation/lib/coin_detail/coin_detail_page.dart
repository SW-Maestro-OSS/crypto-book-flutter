import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/coin_detail/coin_detail_viewmodel.dart';
import 'package:presentation/coin_detail/coin_detail_state.dart';
import 'package:presentation/coin_detail/coin_detail_intent.dart';
import 'package:presentation/coin_detail/coin_detail_side_effect.dart';
import 'package:presentation/coin_detail/widgets/price_header.dart';
import 'package:presentation/coin_detail/widgets/metric_card.dart';
import 'package:presentation/coin_detail/widgets/price_chart_widget.dart';
import 'package:presentation/coin_detail/widgets/insight_section.dart';
import 'package:presentation/coin_detail/widgets/article_section.dart';
import 'package:presentation/core/mvi/side_effect_listener.dart';
import 'package:presentation/core/widgets/error_handler.dart';
import 'package:presentation/core/theme/app_spacing.dart';
import 'package:presentation/core/utils/number_formatter.dart';
import 'package:presentation/core/utils/price_formatter.dart';
import 'package:presentation/core/l10n/app_strings.dart';
import 'package:presentation/providers/app_settings_provider.dart';
import 'package:presentation/providers/app_strings_provider.dart';

class CoinDetailPage extends ConsumerWidget {
  final String symbol;

  const CoinDetailPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coinDetailViewModelProvider(symbol));
    final viewModel = ref.read(coinDetailViewModelProvider(symbol).notifier);
    final strings = ref.watch(appStringsProvider);
    final appSettings = ref.watch(appSettingsProvider);

    return SideEffectListener<CoinDetailSideEffect>(
      sideEffects: viewModel.sideEffects,
      onSideEffect: (context, sideEffect) {
        sideEffect.when(
          showError: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
          showToast: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          navigateBack: () {
            Navigator.of(context).maybePop();
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          forceMaterialTransparency: true,
          title: Text(symbol),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // TODO: options menu
              },
            ),
          ],
        ),
        body: state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (
            ticker,
            chartData,
            selectedTimeframe,
            isLoadingChart,
            articles,
            isLoadingNews,
            aiInsight,
            aiStatus,
          ) =>
              SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PriceHeader(ticker: ticker),

                const SizedBox(height: AppSpacing.xxl),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.gridPadding,
                  ),
                  child: PriceChartWidget(
                    chartData: chartData,
                    selectedTimeframe: selectedTimeframe,
                    isLoading: isLoadingChart,
                    onTimeframeChanged: (timeframe) {
                      viewModel.onIntent(
                        CoinDetailIntent.changeTimeframe(timeframe),
                      );
                    },
                    strings: strings,
                    currency: appSettings.currency,
                    exchangeRate: appSettings.exchangeRate,
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.gridPadding,
                  ),
                  child: _buildMetricsGrid(ticker, strings, appSettings),
                ),

                const SizedBox(height: AppSpacing.sectionSpacing),

                // AI Insight
                InsightSection(
                  insight: aiInsight,
                  aiStatus: aiStatus,
                  onRequestAnalysis: () {
                    viewModel.onIntent(
                      const CoinDetailIntent.requestAiAnalysis(),
                    );
                  },
                  strings: strings,
                ),

                const SizedBox(height: AppSpacing.sectionSpacing),

                // News Articles
                ArticleSection(
                  articles: articles ?? [],
                  isLoading: isLoadingNews,
                  strings: strings,
                ),

                const SizedBox(height: AppSpacing.sectionSpacing),
              ],
            ),
          ),
          error: (error) => ErrorHandler(
            error: error,
            onRetry: () {
              viewModel.onIntent(CoinDetailIntent.load(symbol));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMetricsGrid(
    dynamic ticker,
    AppStrings strings,
    AppSettings appSettings,
  ) {
    String formatPrice(double price) => PriceFormatter.format(
          priceInUSD: price,
          currency: appSettings.currency,
          exchangeRate: appSettings.exchangeRate,
        );

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: AppSpacing.gridSpacing,
      crossAxisSpacing: AppSpacing.gridSpacing,
      childAspectRatio: 2.2,
      children: [
        MetricCard(
          label: strings.high24h,
          value: formatPrice(ticker.high24h),
        ),
        MetricCard(
          label: strings.low24h,
          value: formatPrice(ticker.low24h),
        ),
        MetricCard(
          label: strings.volume24h,
          value: NumberFormatter.formatVolume(ticker.volume24h),
        ),
        MetricCard(
          label: strings.quoteVolume,
          value: NumberFormatter.formatVolume(ticker.quoteVolume24h),
        ),
      ],
    );
  }
}
