class BinanceConstants {
  // REST API
  static const String restApiBaseUrl = 'https://api.binance.com';

  // WebSocket
  static const String wsBaseUrl = 'wss://stream.binance.com:9443';
  static const String wsStreamPath = '/ws';

  // API Endpoints
  static const String exchangeInfoEndpoint = '/api/v3/exchangeInfo';
  static const String ticker24hEndpoint = '/api/v3/ticker/24hr';

  // Timeouts
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
