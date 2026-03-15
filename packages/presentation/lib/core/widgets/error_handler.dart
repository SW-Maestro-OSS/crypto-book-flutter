import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/errors/app_error.dart';
import 'package:presentation/core/l10n/app_strings.dart';
import 'package:presentation/providers/app_strings_provider.dart';

/// Widget that displays error messages and recovery options based on AppError
class ErrorHandler extends ConsumerWidget {
  final AppError error;
  final VoidCallback? onRetry;

  const ErrorHandler({
    super.key,
    required this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(appStringsProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getErrorIcon(),
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              error.userMessage,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              _getSuggestedAction(strings),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            if (error.isRecoverable && onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(strings.retry),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getErrorIcon() {
    return error.isRecoverable
        ? Icons.error_outline
        : Icons.warning_amber_rounded;
  }

  String _getSuggestedAction(AppStrings strings) {
    if (!error.isRecoverable) {
      return strings.tryAgainLater;
    }

    // Check error type and provide specific guidance
    final technicalMessage = error.technicalMessage.toLowerCase();

    if (technicalMessage.contains('internet') ||
        technicalMessage.contains('connection')) {
      return strings.checkConnection;
    }

    if (technicalMessage.contains('timeout')) {
      return strings.networkUnstable;
    }

    if (technicalMessage.contains('not found')) {
      return strings.infoNotFound;
    }

    return strings.pressRetry;
  }
}
