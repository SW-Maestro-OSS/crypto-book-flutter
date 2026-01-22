import 'app_error.dart';

/// Domain-specific errors related to cryptocurrency operations
abstract class CoinError implements AppError {
  const CoinError();
}

/// Symbol not found in the system
class SymbolNotFoundError extends CoinError {
  final String symbol;

  const SymbolNotFoundError(this.symbol);

  @override
  String get userMessage => '코인을 찾을 수 없습니다: $symbol';

  @override
  String get technicalMessage => 'Symbol not found: $symbol';

  @override
  bool get isRecoverable => true;
}

/// Error parsing coin data
class ParseError extends CoinError {
  final String details;

  const ParseError(this.details);

  @override
  String get userMessage => '데이터를 처리하는 중 오류가 발생했습니다';

  @override
  String get technicalMessage => 'Parse error: $details';

  @override
  bool get isRecoverable => false;
}

/// Error accessing/updating cache
class CacheError extends CoinError {
  final String details;

  const CacheError(this.details);

  @override
  String get userMessage => '캐시 오류가 발생했습니다';

  @override
  String get technicalMessage => 'Cache error: $details';

  @override
  bool get isRecoverable => true;
}

/// Unknown coin-related error
class UnknownCoinError extends CoinError {
  final String details;

  const UnknownCoinError(this.details);

  @override
  String get userMessage => '알 수 없는 오류가 발생했습니다';

  @override
  String get technicalMessage => 'Unknown coin error: $details';

  @override
  bool get isRecoverable => true;
}
