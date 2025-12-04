import 'package:dart_mappable/dart_mappable.dart';
import 'package:domain/domain.dart';

part 'exchange_rate_dto.mapper.dart';

/// 한국수출입은행 환율 API 응답 DTO
@MappableClass()
class ExchangeRateDTO with ExchangeRateDTOMappable {
  @MappableField(key: 'result')
  final int result; // 1: 성공, 2: DATA코드 오류, 3: 인증코드 오류, 4: 일일제한횟수 마감

  @MappableField(key: 'cur_unit')
  final String currencyCode; // 통화코드 (USD, JPY 등)

  @MappableField(key: 'cur_nm')
  final String currencyName; // 국가/통화명

  @MappableField(key: 'ttb')
  final String? ttb; // 전신환(송금) 받으실때

  @MappableField(key: 'tts')
  final String? tts; // 전신환(송금) 보내실때

  @MappableField(key: 'deal_bas_r')
  final String dealBaseRate; // 매매 기준율 (주로 사용)

  @MappableField(key: 'bkpr')
  final String? bookPrice; // 장부가격

  @MappableField(key: 'kftc_deal_bas_r')
  final String? kftcDealBaseRate; // 서울외국환중개 매매기준율

  ExchangeRateDTO({
    required this.result,
    required this.currencyCode,
    required this.currencyName,
    this.ttb,
    this.tts,
    required this.dealBaseRate,
    this.bookPrice,
    this.kftcDealBaseRate,
  });

  /// DTO를 Entity로 변환
  ExchangeRateEntity toEntity() {
    // 매매 기준율을 파싱 (콤마 제거 후 double로 변환)
    final rateValue = double.tryParse(dealBaseRate.replaceAll(',', '')) ?? 1.0;

    return ExchangeRateEntity(
      fromCurrency: currencyCode,
      toCurrency: 'KRW',
      rate: rateValue,
      timestamp: DateTime.now(),
    );
  }

  /// 성공 여부 확인
  bool get isSuccess => result == 1;
}
