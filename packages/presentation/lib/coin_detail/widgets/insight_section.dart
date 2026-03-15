import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:presentation/core/l10n/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// AI Insight section with status-based UI
class InsightSection extends StatelessWidget {
  final AiInsightEntity? insight;
  final AiAnalysisStatus aiStatus;
  final VoidCallback onRequestAnalysis;
  final AppStrings strings;

  const InsightSection({
    super.key,
    required this.insight,
    required this.aiStatus,
    required this.onRequestAnalysis,
    required this.strings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                size: AppSpacing.iconMd,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                strings.aiInsight,
                style: AppTypography.labelLarge,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (aiStatus) {
      case AiAnalysisStatus.idle:
        return _buildIdleState();
      case AiAnalysisStatus.loading:
        return _buildLoadingState();
      case AiAnalysisStatus.completed:
        return _buildCompletedState();
      case AiAnalysisStatus.unavailable:
        return _buildUnavailableState();
      case AiAnalysisStatus.error:
        return _buildErrorState();
    }
  }

  Widget _buildIdleState() {
    return Center(
      child: Column(
        children: [
          Text(
            strings.aiPrompt,
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          ElevatedButton.icon(
            onPressed: onRequestAnalysis,
            icon: const Icon(Icons.auto_awesome, size: 18),
            label: Text(strings.analyze),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: AppSpacing.md),
            Text(strings.analyzing),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedState() {
    if (insight == null) return _buildIdleState();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Insight bullet points
        ...insight!.insights.map((text) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '\u2022 ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: AppTypography.bodyMedium,
                    ),
                  ),
                ],
              ),
            )),

        const SizedBox(height: AppSpacing.lg),

        // Buy vs Sell Pressure
        Text(
          strings.marketPressure,
          style: AppTypography.labelMedium,
        ),
        const SizedBox(height: AppSpacing.sm),

        // Pressure bars
        Row(
          children: [
            Expanded(
              flex: (insight!.buyPressure * 100).toInt().clamp(1, 99),
              child: Container(
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.priceUp,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: (insight!.sellPressure * 100).toInt().clamp(1, 99),
              child: Container(
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.priceDown,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),

        // Pressure labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: AppColors.priceUp,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '${strings.buy} ${(insight!.buyPressure * 100).toInt()}%',
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: AppColors.priceDown,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '${strings.sell} ${(insight!.sellPressure * 100).toInt()}%',
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUnavailableState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            Icon(
              Icons.info_outline,
              size: 32,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              strings.aiUnavailable,
              style: AppTypography.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 32,
            color: AppColors.priceDown,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            strings.analysisFailed,
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton.icon(
            onPressed: onRequestAnalysis,
            icon: const Icon(Icons.refresh, size: 18),
            label: Text(strings.retry),
          ),
        ],
      ),
    );
  }
}
