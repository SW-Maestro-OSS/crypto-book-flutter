// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'coin_dto.dart';

class CoinDTOMapper extends ClassMapperBase<CoinDTO> {
  CoinDTOMapper._();

  static CoinDTOMapper? _instance;
  static CoinDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CoinDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CoinDTO';

  static String _$symbol(CoinDTO v) => v.symbol;
  static const Field<CoinDTO, String> _f$symbol = Field('symbol', _$symbol);
  static String _$baseAsset(CoinDTO v) => v.baseAsset;
  static const Field<CoinDTO, String> _f$baseAsset = Field(
    'baseAsset',
    _$baseAsset,
  );
  static String _$quoteAsset(CoinDTO v) => v.quoteAsset;
  static const Field<CoinDTO, String> _f$quoteAsset = Field(
    'quoteAsset',
    _$quoteAsset,
  );

  @override
  final MappableFields<CoinDTO> fields = const {
    #symbol: _f$symbol,
    #baseAsset: _f$baseAsset,
    #quoteAsset: _f$quoteAsset,
  };

  static CoinDTO _instantiate(DecodingData data) {
    return CoinDTO(
      symbol: data.dec(_f$symbol),
      baseAsset: data.dec(_f$baseAsset),
      quoteAsset: data.dec(_f$quoteAsset),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CoinDTO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CoinDTO>(map);
  }

  static CoinDTO fromJson(String json) {
    return ensureInitialized().decodeJson<CoinDTO>(json);
  }
}

mixin CoinDTOMappable {
  String toJson() {
    return CoinDTOMapper.ensureInitialized().encodeJson<CoinDTO>(
      this as CoinDTO,
    );
  }

  Map<String, dynamic> toMap() {
    return CoinDTOMapper.ensureInitialized().encodeMap<CoinDTO>(
      this as CoinDTO,
    );
  }

  CoinDTOCopyWith<CoinDTO, CoinDTO, CoinDTO> get copyWith =>
      _CoinDTOCopyWithImpl<CoinDTO, CoinDTO>(
        this as CoinDTO,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CoinDTOMapper.ensureInitialized().stringifyValue(this as CoinDTO);
  }

  @override
  bool operator ==(Object other) {
    return CoinDTOMapper.ensureInitialized().equalsValue(
      this as CoinDTO,
      other,
    );
  }

  @override
  int get hashCode {
    return CoinDTOMapper.ensureInitialized().hashValue(this as CoinDTO);
  }
}

extension CoinDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, CoinDTO, $Out> {
  CoinDTOCopyWith<$R, CoinDTO, $Out> get $asCoinDTO =>
      $base.as((v, t, t2) => _CoinDTOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CoinDTOCopyWith<$R, $In extends CoinDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? symbol, String? baseAsset, String? quoteAsset});
  CoinDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CoinDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CoinDTO, $Out>
    implements CoinDTOCopyWith<$R, CoinDTO, $Out> {
  _CoinDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CoinDTO> $mapper =
      CoinDTOMapper.ensureInitialized();
  @override
  $R call({String? symbol, String? baseAsset, String? quoteAsset}) => $apply(
    FieldCopyWithData({
      if (symbol != null) #symbol: symbol,
      if (baseAsset != null) #baseAsset: baseAsset,
      if (quoteAsset != null) #quoteAsset: quoteAsset,
    }),
  );
  @override
  CoinDTO $make(CopyWithData data) => CoinDTO(
    symbol: data.get(#symbol, or: $value.symbol),
    baseAsset: data.get(#baseAsset, or: $value.baseAsset),
    quoteAsset: data.get(#quoteAsset, or: $value.quoteAsset),
  );

  @override
  CoinDTOCopyWith<$R2, CoinDTO, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CoinDTOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

