// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exchange_rate_dto.dart';

class ExchangeRateDTOMapper extends ClassMapperBase<ExchangeRateDTO> {
  ExchangeRateDTOMapper._();

  static ExchangeRateDTOMapper? _instance;
  static ExchangeRateDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExchangeRateDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ExchangeRateDTO';

  static int _$result(ExchangeRateDTO v) => v.result;
  static const Field<ExchangeRateDTO, int> _f$result = Field(
    'result',
    _$result,
  );
  static String _$currencyCode(ExchangeRateDTO v) => v.currencyCode;
  static const Field<ExchangeRateDTO, String> _f$currencyCode = Field(
    'currencyCode',
    _$currencyCode,
    key: r'cur_unit',
  );
  static String _$currencyName(ExchangeRateDTO v) => v.currencyName;
  static const Field<ExchangeRateDTO, String> _f$currencyName = Field(
    'currencyName',
    _$currencyName,
    key: r'cur_nm',
  );
  static String? _$ttb(ExchangeRateDTO v) => v.ttb;
  static const Field<ExchangeRateDTO, String> _f$ttb = Field(
    'ttb',
    _$ttb,
    opt: true,
  );
  static String? _$tts(ExchangeRateDTO v) => v.tts;
  static const Field<ExchangeRateDTO, String> _f$tts = Field(
    'tts',
    _$tts,
    opt: true,
  );
  static String _$dealBaseRate(ExchangeRateDTO v) => v.dealBaseRate;
  static const Field<ExchangeRateDTO, String> _f$dealBaseRate = Field(
    'dealBaseRate',
    _$dealBaseRate,
    key: r'deal_bas_r',
  );
  static String? _$bookPrice(ExchangeRateDTO v) => v.bookPrice;
  static const Field<ExchangeRateDTO, String> _f$bookPrice = Field(
    'bookPrice',
    _$bookPrice,
    key: r'bkpr',
    opt: true,
  );
  static String? _$kftcDealBaseRate(ExchangeRateDTO v) => v.kftcDealBaseRate;
  static const Field<ExchangeRateDTO, String> _f$kftcDealBaseRate = Field(
    'kftcDealBaseRate',
    _$kftcDealBaseRate,
    key: r'kftc_deal_bas_r',
    opt: true,
  );

  @override
  final MappableFields<ExchangeRateDTO> fields = const {
    #result: _f$result,
    #currencyCode: _f$currencyCode,
    #currencyName: _f$currencyName,
    #ttb: _f$ttb,
    #tts: _f$tts,
    #dealBaseRate: _f$dealBaseRate,
    #bookPrice: _f$bookPrice,
    #kftcDealBaseRate: _f$kftcDealBaseRate,
  };

  static ExchangeRateDTO _instantiate(DecodingData data) {
    return ExchangeRateDTO(
      result: data.dec(_f$result),
      currencyCode: data.dec(_f$currencyCode),
      currencyName: data.dec(_f$currencyName),
      ttb: data.dec(_f$ttb),
      tts: data.dec(_f$tts),
      dealBaseRate: data.dec(_f$dealBaseRate),
      bookPrice: data.dec(_f$bookPrice),
      kftcDealBaseRate: data.dec(_f$kftcDealBaseRate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ExchangeRateDTO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExchangeRateDTO>(map);
  }

  static ExchangeRateDTO fromJson(String json) {
    return ensureInitialized().decodeJson<ExchangeRateDTO>(json);
  }
}

mixin ExchangeRateDTOMappable {
  String toJson() {
    return ExchangeRateDTOMapper.ensureInitialized()
        .encodeJson<ExchangeRateDTO>(this as ExchangeRateDTO);
  }

  Map<String, dynamic> toMap() {
    return ExchangeRateDTOMapper.ensureInitialized().encodeMap<ExchangeRateDTO>(
      this as ExchangeRateDTO,
    );
  }

  ExchangeRateDTOCopyWith<ExchangeRateDTO, ExchangeRateDTO, ExchangeRateDTO>
  get copyWith =>
      _ExchangeRateDTOCopyWithImpl<ExchangeRateDTO, ExchangeRateDTO>(
        this as ExchangeRateDTO,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExchangeRateDTOMapper.ensureInitialized().stringifyValue(
      this as ExchangeRateDTO,
    );
  }

  @override
  bool operator ==(Object other) {
    return ExchangeRateDTOMapper.ensureInitialized().equalsValue(
      this as ExchangeRateDTO,
      other,
    );
  }

  @override
  int get hashCode {
    return ExchangeRateDTOMapper.ensureInitialized().hashValue(
      this as ExchangeRateDTO,
    );
  }
}

extension ExchangeRateDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExchangeRateDTO, $Out> {
  ExchangeRateDTOCopyWith<$R, ExchangeRateDTO, $Out> get $asExchangeRateDTO =>
      $base.as((v, t, t2) => _ExchangeRateDTOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExchangeRateDTOCopyWith<$R, $In extends ExchangeRateDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? result,
    String? currencyCode,
    String? currencyName,
    String? ttb,
    String? tts,
    String? dealBaseRate,
    String? bookPrice,
    String? kftcDealBaseRate,
  });
  ExchangeRateDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ExchangeRateDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExchangeRateDTO, $Out>
    implements ExchangeRateDTOCopyWith<$R, ExchangeRateDTO, $Out> {
  _ExchangeRateDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExchangeRateDTO> $mapper =
      ExchangeRateDTOMapper.ensureInitialized();
  @override
  $R call({
    int? result,
    String? currencyCode,
    String? currencyName,
    Object? ttb = $none,
    Object? tts = $none,
    String? dealBaseRate,
    Object? bookPrice = $none,
    Object? kftcDealBaseRate = $none,
  }) => $apply(
    FieldCopyWithData({
      if (result != null) #result: result,
      if (currencyCode != null) #currencyCode: currencyCode,
      if (currencyName != null) #currencyName: currencyName,
      if (ttb != $none) #ttb: ttb,
      if (tts != $none) #tts: tts,
      if (dealBaseRate != null) #dealBaseRate: dealBaseRate,
      if (bookPrice != $none) #bookPrice: bookPrice,
      if (kftcDealBaseRate != $none) #kftcDealBaseRate: kftcDealBaseRate,
    }),
  );
  @override
  ExchangeRateDTO $make(CopyWithData data) => ExchangeRateDTO(
    result: data.get(#result, or: $value.result),
    currencyCode: data.get(#currencyCode, or: $value.currencyCode),
    currencyName: data.get(#currencyName, or: $value.currencyName),
    ttb: data.get(#ttb, or: $value.ttb),
    tts: data.get(#tts, or: $value.tts),
    dealBaseRate: data.get(#dealBaseRate, or: $value.dealBaseRate),
    bookPrice: data.get(#bookPrice, or: $value.bookPrice),
    kftcDealBaseRate: data.get(#kftcDealBaseRate, or: $value.kftcDealBaseRate),
  );

  @override
  ExchangeRateDTOCopyWith<$R2, ExchangeRateDTO, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExchangeRateDTOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

