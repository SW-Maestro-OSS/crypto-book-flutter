import 'package:flutter/material.dart';
import 'package:presentation/core/l10n/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../home_state.dart';

class SortHeader extends StatelessWidget {
  final SortType currentSortType;
  final bool isAscending;
  final ValueChanged<SortType> onSortChanged;
  final AppStrings strings;

  const SortHeader({
    super.key,
    required this.currentSortType,
    required this.isAscending,
    required this.onSortChanged,
    required this.strings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.sortHeaderHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sortHeaderPadding,
        vertical: AppSpacing.sortHeaderPaddingVertical,
      ),
      decoration: const BoxDecoration(
        color: AppColors.backgroundSecondary,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
            width: AppSpacing.borderWidthThin,
          ),
        ),
      ),
      child: Row(
        children: [
          // Symbol column
          Expanded(
            flex: 3,
            child: _SortHeaderItem(
              label: strings.symbol,
              sortType: SortType.symbol,
              currentSortType: currentSortType,
              isAscending: isAscending,
              onTap: () => onSortChanged(SortType.symbol),
            ),
          ),
          // Price column
          Expanded(
            flex: 3,
            child: _SortHeaderItem(
              label: strings.price,
              sortType: SortType.price,
              currentSortType: currentSortType,
              isAscending: isAscending,
              onTap: () => onSortChanged(SortType.price),
              alignment: Alignment.centerRight,
            ),
          ),
          // 24h Change % column
          Expanded(
            flex: 2,
            child: _SortHeaderItem(
              label: strings.change24h,
              sortType: SortType.changePercent,
              currentSortType: currentSortType,
              isAscending: isAscending,
              onTap: () => onSortChanged(SortType.changePercent),
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }
}

class _SortHeaderItem extends StatelessWidget {
  final String label;
  final SortType sortType;
  final SortType currentSortType;
  final bool isAscending;
  final VoidCallback onTap;
  final Alignment alignment;

  const _SortHeaderItem({
    required this.label,
    required this.sortType,
    required this.currentSortType,
    required this.isAscending,
    required this.onTap,
    this.alignment = Alignment.centerLeft,
  });

  bool get isActive => currentSortType == sortType;

  IconData get _sortIcon {
    if (!isActive) return Icons.unfold_more;
    return isAscending ? Icons.arrow_upward : Icons.arrow_downward;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: isActive
                  ? AppTypography.sortHeaderActive
                  : AppTypography.sortHeader,
            ),
            const SizedBox(width: AppSpacing.xs),
            Icon(
              _sortIcon,
              size: AppSpacing.iconXs,
              color: isActive ? AppColors.primary : AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }
}
