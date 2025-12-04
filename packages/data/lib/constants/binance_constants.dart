import 'package:flutter_dotenv/flutter_dotenv.dart';

class BinanceConstants {
  // REST API
  static String get restApiBaseUrl =>
      dotenv.env['BINANCE_BASE_URL'] ?? 'https://api.binance.com';

  // WebSocket
  static String get wsBaseUrl =>
      dotenv.env['BINANCE_WS_URL'] ?? 'wss://stream.binance.com:9443';
  static const String wsStreamPath = '/ws';

  // API Keys (선택적 - 필요한 경우)
  static String? get apiKey => dotenv.env['BINANCE_API_KEY'];
  static String? get secretKey => dotenv.env['BINANCE_SECRET_KEY'];

  // API Endpoints
  static const String exchangeInfoEndpoint = '/api/v3/exchangeInfo';
  static const String ticker24hEndpoint = '/api/v3/ticker/24hr';

  // Timeouts
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
