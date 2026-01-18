/// Base abstract class for all application errors.
///
/// This provides a consistent interface for error handling across the app,
/// with support for user-facing messages and recoverability detection.
abstract class AppError implements Exception {
  const AppError();

  /// User-friendly message to display in the UI
  String get userMessage;

  /// Technical details for logging/debugging
  String get technicalMessage;

  /// Whether the user can take action to recover from this error
  bool get isRecoverable;

  @override
  String toString() => 'AppError: $technicalMessage';
}
