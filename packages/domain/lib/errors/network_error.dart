import 'app_error.dart';

/// Network-related errors with HTTP status code awareness
abstract class NetworkError implements AppError {
  const NetworkError();
}

/// No internet connection available
class NoInternetError extends NetworkError {
  const NoInternetError();

  @override
  String get userMessage => '인터넷 연결을 확인해주세요';

  @override
  String get technicalMessage => 'No internet connection';

  @override
  bool get isRecoverable => true;
}

/// Request timeout
class TimeoutError extends NetworkError {
  const TimeoutError();

  @override
  String get userMessage => '요청 시간이 초과되었습니다. 다시 시도해주세요';

  @override
  String get technicalMessage => 'Request timeout';

  @override
  bool get isRecoverable => true;
}

/// Server error (500-599) - non-recoverable, user can't fix
class ServerError extends NetworkError {
  final int statusCode;
  final String? message;

  const ServerError(this.statusCode, [this.message]);

  @override
  String get userMessage => '서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요';

  @override
  String get technicalMessage =>
      'Server error $statusCode${message != null ? ': $message' : ''}';

  @override
  bool get isRecoverable => false; // 500 errors: log only, generic message
}

/// Bad request (400-499) - recoverable, user can take action
class BadRequestError extends NetworkError {
  final String message;
  final String? errorCode;

  const BadRequestError(this.message, [this.errorCode]);

  @override
  String get userMessage => message;

  @override
  String get technicalMessage =>
      'Bad request${errorCode != null ? ' [$errorCode]' : ''}: $message';

  @override
  bool get isRecoverable => true; // 400 errors: show specific message, user can recover
}

/// Generic network error
class GenericNetworkError extends NetworkError {
  final String details;

  const GenericNetworkError(this.details);

  @override
  String get userMessage => '네트워크 오류가 발생했습니다';

  @override
  String get technicalMessage => 'Network error: $details';

  @override
  bool get isRecoverable => true;
}
