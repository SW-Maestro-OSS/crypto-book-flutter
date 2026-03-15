import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/settings/setting_viewmodel.dart';
import 'package:presentation/settings/setting_state.dart';
import 'package:presentation/settings/setting_intent.dart';
import 'package:presentation/core/l10n/app_strings.dart';
import 'package:presentation/core/theme/app_colors.dart';
import 'package:presentation/core/theme/app_spacing.dart';
import 'package:presentation/core/theme/app_typography.dart';
import 'package:presentation/core/utils/date_formatter.dart';
import 'package:presentation/core/widgets/error_handler.dart';
import 'package:presentation/providers/app_strings_provider.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingViewModelProvider);
    final strings = ref.watch(appStringsProvider);

    return Column(
      children: [
        AppBar(
          title: Text(strings.settings),
        ),
        Expanded(
          child: state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (currency, language, exchangeRate, lastUpdated) {
              return ListView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                children: [
                  // Currency Section
                  _buildSectionTitle(strings.currency),
                  const SizedBox(height: AppSpacing.sm),
                  _buildCurrencyOptions(context, ref, currency, strings),
                  const SizedBox(height: AppSpacing.xxl),

                  // Language Section
                  _buildSectionTitle(strings.language),
                  const SizedBox(height: AppSpacing.sm),
                  _buildLanguageOptions(context, ref, language, strings),
                  const SizedBox(height: AppSpacing.xxl),

                  // Exchange Rate Section (only show if KRW)
                  if (currency == 'KRW') ...[
                    _buildSectionTitle(strings.exchangeRate),
                    const SizedBox(height: AppSpacing.sm),
                    _buildExchangeRateCard(
                      context,
                      ref,
                      exchangeRate,
                      lastUpdated,
                      strings,
                    ),
                  ],
                ],
              );
            },
            error: (error) => ErrorHandler(
              error: error,
              onRetry: () {
                ref.read(settingViewModelProvider.notifier).onIntent(
                      const SettingIntent.load(),
                    );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTypography.labelLarge.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildCurrencyOptions(
    BuildContext context,
    WidgetRef ref,
    String currentCurrency,
    AppStrings strings,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildOptionCard(
            context: context,
            title: strings.dollar,
            subtitle: 'USD',
            icon: Icons.attach_money,
            isSelected: currentCurrency == 'USD',
            onTap: () {
              ref.read(settingViewModelProvider.notifier).onIntent(
                    const SettingIntent.changeCurrency('USD'),
                  );
            },
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _buildOptionCard(
            context: context,
            title: strings.won,
            subtitle: 'KRW',
            icon: Icons.currency_yen,
            isSelected: currentCurrency == 'KRW',
            onTap: () {
              ref.read(settingViewModelProvider.notifier).onIntent(
                    const SettingIntent.changeCurrency('KRW'),
                  );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageOptions(
    BuildContext context,
    WidgetRef ref,
    String currentLanguage,
    AppStrings strings,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildOptionCard(
            context: context,
            title: strings.english,
            subtitle: 'EN',
            icon: Icons.language,
            isSelected: currentLanguage == 'en',
            onTap: () {
              ref.read(settingViewModelProvider.notifier).onIntent(
                    const SettingIntent.changeLanguage('en'),
                  );
            },
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _buildOptionCard(
            context: context,
            title: strings.korean,
            subtitle: 'KO',
            icon: Icons.language,
            isSelected: currentLanguage == 'ko',
            onTap: () {
              ref.read(settingViewModelProvider.notifier).onIntent(
                    const SettingIntent.changeLanguage('ko'),
                  );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.surface,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: AppSpacing.iconLg,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: AppTypography.labelLarge.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              subtitle,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExchangeRateCard(
    BuildContext context,
    WidgetRef ref,
    exchangeRate,
    DateTime? lastUpdated,
    AppStrings strings,
  ) {
    final timeAgo = lastUpdated != null
        ? DateFormatter.timeAgo(lastUpdated, strings)
        : strings.never;

    final rateText = exchangeRate != null
        ? '${exchangeRate.rate.toStringAsFixed(2)} KRW'
        : strings.loading;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1 USD =',
                style: AppTypography.bodyMedium,
              ),
              Text(
                rateText,
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${strings.lastUpdated}: $timeAgo',
                style: AppTypography.bodySmall,
              ),
              TextButton.icon(
                onPressed: () {
                  ref.read(settingViewModelProvider.notifier).onIntent(
                        const SettingIntent.refreshExchangeRate(),
                      );
                },
                icon: const Icon(Icons.refresh, size: AppSpacing.iconSm),
                label: Text(strings.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
