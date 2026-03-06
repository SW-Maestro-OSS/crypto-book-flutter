import 'package:dart_mappable/dart_mappable.dart';
import 'package:domain/domain.dart';

part 'news_dto.mapper.dart';

@MappableClass()
class CryptoPanicResponseDTO with CryptoPanicResponseDTOMappable {
  final List<CryptoPanicPostDTO>? results;

  CryptoPanicResponseDTO({this.results});
}

@MappableClass()
class CryptoPanicPostDTO with CryptoPanicPostDTOMappable {
  final String? title;
  final String? url;
  @MappableField(key: 'published_at')
  final String? publishedAt;
  final CryptoPanicSourceDTO? source;

  CryptoPanicPostDTO({this.title, this.url, this.publishedAt, this.source});

  NewsArticleEntity toEntity() {
    return NewsArticleEntity(
      title: title ?? 'Untitled',
      source: source?.title ?? 'Unknown',
      publishedAt: publishedAt != null
          ? DateTime.tryParse(publishedAt!) ?? DateTime.now()
          : DateTime.now(),
      url: url ?? '',
    );
  }
}

@MappableClass()
class CryptoPanicSourceDTO with CryptoPanicSourceDTOMappable {
  final String? title;
  final String? domain;

  CryptoPanicSourceDTO({this.title, this.domain});
}
