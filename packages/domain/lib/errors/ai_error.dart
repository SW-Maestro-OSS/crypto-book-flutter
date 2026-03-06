import 'package:domain/errors/app_error.dart';

class AiUnavailableError extends AppError {
  const AiUnavailableError();

  @override
  String get userMessage => 'AI analysis is not available on this device';

  @override
  String get technicalMessage => 'flutter_local_ai not supported on this device';

  @override
  bool get isRecoverable => false;

  @override
  String toString() => 'AiUnavailableError: $technicalMessage';
}

class AiAnalysisError extends AppError {
  final String reason;

  const AiAnalysisError(this.reason);

  @override
  String get userMessage => 'AI analysis failed: $reason';

  @override
  String get technicalMessage => reason;

  @override
  bool get isRecoverable => true;

  @override
  String toString() => 'AiAnalysisError: $reason';
}
