import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class SearchBarWidget extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchBarWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.hintText = 'Search coins...',
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(SearchBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.searchBarHeight,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.searchBarMargin,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: AppColors.borderLight,
          width: AppSpacing.borderWidthThin,
        ),
      ),
      child: TextField(
        controller: _controller,
        style: AppTypography.searchInput,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTypography.searchHint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.searchBarPadding,
            vertical: AppSpacing.md,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.textTertiary,
            size: AppSpacing.iconMd,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.textTertiary,
                    size: AppSpacing.iconSm,
                  ),
                  onPressed: _clearSearch,
                )
              : null,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
