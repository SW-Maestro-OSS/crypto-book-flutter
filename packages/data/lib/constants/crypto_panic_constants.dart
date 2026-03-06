import 'package:flutter_dotenv/flutter_dotenv.dart';

class CryptoPanicConstants {
  static String get baseUrl =>
      dotenv.env['CRYPTOPANIC_BASE_URL'] ?? 'https://cryptopanic.com/api/developer/v2';

  static String get apiKey =>
      dotenv.env['CRYPTOPANIC_API_KEY'] ?? '';
}
