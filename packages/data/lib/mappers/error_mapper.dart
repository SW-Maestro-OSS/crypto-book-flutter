import 'package:dio/dio.dart';
import 'package:domain/errors/network_error.dart';

/// Maps DioException to typed NetworkError classes
class ErrorMapper {
  /// Convert DioException to appropriate NetworkError
  static NetworkError fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutError();

      case DioExceptionType.connectionError:
        return const NoInternetError();

      case DioExceptionType.badResponse:
        return _mapResponseError(exception);

      case DioExceptionType.cancel:
        return const GenericNetworkError('Request cancelled');

      case DioExceptionType.badCertificate:
        return const GenericNetworkError('SSL certificate error');

      case DioExceptionType.unknown:
        return GenericNetworkError(
          exception.message ?? 'Unknown network error',
        );
    }
  }

  /// Map HTTP response errors based on status code
  static NetworkError _mapResponseError(DioException exception) {
    final statusCode = exception.response?.statusCode;

    if (statusCode == null) {
      return const GenericNetworkError('No response from server');
    }

    // 400-499: Client errors - recoverable with user action
    if (statusCode >= 400 && statusCode < 500) {
      final message = _extractErrorMessage(exception) ??
                      _getDefaultClientErrorMessage(statusCode);
      final errorCode = _extractErrorCode(exception);
      return BadRequestError(message, errorCode);
    }

    // 500-599: Server errors - non-recoverable
    if (statusCode >= 500 && statusCode < 600) {
      final message = _extractErrorMessage(exception);
      return ServerError(statusCode, message);
    }

    // Other status codes
    return GenericNetworkError('HTTP $statusCode');
  }

  /// Extract error message from response body
  static String? _extractErrorMessage(DioException exception) {
    final data = exception.response?.data;

    if (data is Map<String, dynamic>) {
      // Try common error message fields
      return data['message'] as String? ??
             data['error'] as String? ??
             data['msg'] as String?;
    }

    return null;
  }

  /// Extract error code from response body
  static String? _extractErrorCode(DioException exception) {
    final data = exception.response?.data;

    if (data is Map<String, dynamic>) {
      return data['code'] as String? ?? data['errorCode'] as String?;
    }

    return null;
  }

  /// Default user-friendly messages for common 4xx errors
  static String _getDefaultClientErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return '잘못된 요청입니다';
      case 401:
        return '인증이 필요합니다';
      case 403:
        return '접근 권한이 없습니다';
      case 404:
        return '요청한 리소스를 찾을 수 없습니다';
      case 429:
        return '요청이 너무 많습니다. 잠시 후 다시 시도해주세요';
      default:
        return '요청을 처리할 수 없습니다';
    }
  }
}
