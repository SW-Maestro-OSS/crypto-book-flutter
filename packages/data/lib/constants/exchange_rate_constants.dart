import 'package:flutter_dotenv/flutter_dotenv.dart';

class ExchangeRateConstants {
  // API Base URL
  static String get baseUrl =>
      dotenv.env['EXCHANGE_RATE_BASE_URL'] ?? 'https://oapi.koreaexim.go.kr';

  // API Key
  static String? get apiKey => dotenv.env['EXCHANGE_RATE_API_KEY'];

  // API Endpoints
  static const String exchangeRateEndpoint = '/site/program/financial/exchangeJSON';

  // API Data Type
  static const String dataTypeExchangeRate = 'AP01'; // 환율

  // Timeouts
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
