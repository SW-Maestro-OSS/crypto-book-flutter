import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Related articles/news section
class ArticleSection extends StatelessWidget {
  final List<NewsArticleEntity> articles;
  final bool isLoading;

  const ArticleSection({
    super.key,
    required this.articles,
    this.isLoading = false,
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

          if (isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: CircularProgressIndicator(),
              ),
            )
          else if (articles.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  'No articles available',
                  style: AppTypography.bodyMedium,
                ),
              ),
            )
          else
            ...articles.map((article) => _buildArticleRow(context, article)),
        ],
      ),
    );
  }

  Widget _buildArticleRow(BuildContext context, NewsArticleEntity article) {
    return InkWell(
      onTap: article.url.isNotEmpty
          ? () => _openUrl(context, article.url)
          : null,
      child: Padding(
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
                  '\u2022',
                  style: AppTypography.bodySmall,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  _getTimeAgo(article.publishedAt),
                  style: AppTypography.bodySmall,
                ),
                if (article.url.isNotEmpty) ...[
                  const Spacer(),
                  Icon(
                    Icons.open_in_new,
                    size: 14,
                    color: AppColors.textTertiary,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openUrl(BuildContext context, String url) {
    // url_launcher would be used here in a real app
    // For now, show a snackbar with the URL
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening: $url')),
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
