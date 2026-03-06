import 'package:domain/domain.dart';
import 'package:data/datasources/crypto_panic_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final CryptoPanicDataSource dataSource;

  NewsRepositoryImpl({required this.dataSource});

  @override
  Future<List<NewsArticleEntity>> getNews(String symbol, {int limit = 5}) async {
    final posts = await dataSource.getNews(symbol, limit: limit);
    return posts.map((post) => post.toEntity()).toList();
  }
}
