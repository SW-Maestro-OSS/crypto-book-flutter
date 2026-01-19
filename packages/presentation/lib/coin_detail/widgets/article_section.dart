import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Related articles/news section
class ArticleSection extends StatelessWidget {
  final List<NewsArticleEntity> articles;

  const ArticleSection({
    super.key,
    required this.articles,
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
                Icons.article_outlined,
                size: AppSpacing.iconMd,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Related Articles',
                style: AppTypography.labelLarge,
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // Article list
          ...articles.map((article) => _buildArticleRow(article)),
        ],
      ),
    );
  }

  Widget _buildArticleRow(NewsArticleEntity article) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            children: [
              Text(
                article.source,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '•',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                _getTimeAgo(article.publishedAt),
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}

