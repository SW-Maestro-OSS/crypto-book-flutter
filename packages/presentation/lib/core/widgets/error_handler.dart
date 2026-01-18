import 'package:flutter/material.dart';
import 'package:domain/errors/app_error.dart';

/// Widget that displays error messages and recovery options based on AppError
class ErrorHandler extends StatelessWidget {
  final AppError error;
  final VoidCallback? onRetry;

  const ErrorHandler({
    super.key,
    required this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
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
              _getSuggestedAction(),
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
                label: const Text('다시 시도'),
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

  String _getSuggestedAction() {
    if (!error.isRecoverable) {
      return '잠시 후 다시 시도해주세요';
    }

    // Check error type and provide specific guidance
    final technicalMessage = error.technicalMessage.toLowerCase();

    if (technicalMessage.contains('internet') ||
        technicalMessage.contains('connection')) {
      return '인터넷 연결 상태를 확인하고 다시 시도해주세요';
    }

    if (technicalMessage.contains('timeout')) {
      return '네트워크가 불안정합니다. 다시 시도해주세요';
    }

    if (technicalMessage.contains('not found')) {
      return '요청하신 정보를 찾을 수 없습니다';
    }

    return '아래 버튼을 눌러 다시 시도해주세요';
  }
}
