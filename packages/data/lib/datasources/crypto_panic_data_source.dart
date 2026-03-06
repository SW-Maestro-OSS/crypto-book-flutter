import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:data/constants/crypto_panic_constants.dart';
import 'package:data/dto/news_dto.dart';

class CryptoPanicDataSource {
  final Dio _dio;

  CryptoPanicDataSource({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: CryptoPanicConstants.baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ));

  Future<List<CryptoPanicPostDTO>> getNews(String symbol, {int limit = 5}) async {
    try {
      final response = await _dio.get(
        '/posts/',
        queryParameters: {
          'auth_token': CryptoPanicConstants.apiKey,
          'currencies': symbol,
          'kind': 'news',
          'public': 'true',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final responseDto = CryptoPanicResponseDTOMapper.fromMap(
          response.data as Map<String, dynamic>,
        );
        final posts = responseDto.results ?? [];
        return posts.take(limit).toList();
      }

      return [];
    } catch (e) {
      dev.log('[CryptoPanicDataSource] Failed to fetch news: $e');
      return [];
    }
  }
}
