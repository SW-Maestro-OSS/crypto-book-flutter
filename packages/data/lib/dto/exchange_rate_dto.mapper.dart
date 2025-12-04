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

  static String _$from(ExchangeRateDTO v) => v.from;
  static const Field<ExchangeRateDTO, String> _f$from = Field('from', _$from);
  static String _$to(ExchangeRateDTO v) => v.to;
  static const Field<ExchangeRateDTO, String> _f$to = Field('to', _$to);
  static String _$rate(ExchangeRateDTO v) => v.rate;
  static const Field<ExchangeRateDTO, String> _f$rate = Field('rate', _$rate);

  @override
  final MappableFields<ExchangeRateDTO> fields = const {
    #from: _f$from,
    #to: _f$to,
    #rate: _f$rate,
  };

  static ExchangeRateDTO _instantiate(DecodingData data) {
    return ExchangeRateDTO(
      from: data.dec(_f$from),
      to: data.dec(_f$to),
      rate: data.dec(_f$rate),
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
  $R call({String? from, String? to, String? rate});
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
  $R call({String? from, String? to, String? rate}) => $apply(
    FieldCopyWithData({
      if (from != null) #from: from,
      if (to != null) #to: to,
      if (rate != null) #rate: rate,
    }),
  );
  @override
  ExchangeRateDTO $make(CopyWithData data) => ExchangeRateDTO(
    from: data.get(#from, or: $value.from),
    to: data.get(#to, or: $value.to),
    rate: data.get(#rate, or: $value.rate),
  );

  @override
  ExchangeRateDTOCopyWith<$R2, ExchangeRateDTO, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExchangeRateDTOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

