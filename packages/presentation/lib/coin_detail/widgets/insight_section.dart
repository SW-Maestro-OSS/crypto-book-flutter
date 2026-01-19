import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// AI Insight section displaying analysis and buy/sell pressure
class InsightSection extends StatelessWidget {
  final AiInsightEntity insight;

  const InsightSection({
    super.key,
    required this.insight,
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
                'AI Insight',
                style: AppTypography.labelLarge,
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // Insight bullet points
          ...insight.insights.map((text) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
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
            'Market Pressure',
            style: AppTypography.labelMedium,
          ),
          const SizedBox(height: AppSpacing.sm),

          // Pressure bars
          Row(
            children: [
              Expanded(
                flex: (insight.buyPressure * 100).toInt(),
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
                flex: (insight.sellPressure * 100).toInt(),
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
                    'Buy ${(insight.buyPressure * 100).toInt()}%',
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
                    'Sell ${(insight.sellPressure * 100).toInt()}%',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

