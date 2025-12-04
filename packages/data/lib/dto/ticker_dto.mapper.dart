// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ticker_dto.dart';

class TickerDTOMapper extends ClassMapperBase<TickerDTO> {
  TickerDTOMapper._();

  static TickerDTOMapper? _instance;
  static TickerDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TickerDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TickerDTO';

  static String _$symbol(TickerDTO v) => v.symbol;
  static const Field<TickerDTO, String> _f$symbol = Field('symbol', _$symbol);
  static String _$currentPrice(TickerDTO v) => v.currentPrice;
  static const Field<TickerDTO, String> _f$currentPrice = Field(
    'currentPrice',
    _$currentPrice,
    key: r'c',
  );
  static String _$priceChange(TickerDTO v) => v.priceChange;
  static const Field<TickerDTO, String> _f$priceChange = Field(
    'priceChange',
    _$priceChange,
    key: r'p',
  );
  static String _$priceChangePercent(TickerDTO v) => v.priceChangePercent;
  static const Field<TickerDTO, String> _f$priceChangePercent = Field(
    'priceChangePercent',
    _$priceChangePercent,
    key: r'P',
  );
  static String _$high(TickerDTO v) => v.high;
  static const Field<TickerDTO, String> _f$high = Field(
    'high',
    _$high,
    key: r'h',
  );
  static String _$low(TickerDTO v) => v.low;
  static const Field<TickerDTO, String> _f$low = Field('low', _$low, key: r'l');
  static String _$volume(TickerDTO v) => v.volume;
  static const Field<TickerDTO, String> _f$volume = Field(
    'volume',
    _$volume,
    key: r'v',
  );
  static String? _$imageUrl(TickerDTO v) => v.imageUrl;
  static const Field<TickerDTO, String> _f$imageUrl = Field(
    'imageUrl',
    _$imageUrl,
    opt: true,
  );

  @override
  final MappableFields<TickerDTO> fields = const {
    #symbol: _f$symbol,
    #currentPrice: _f$currentPrice,
    #priceChange: _f$priceChange,
    #priceChangePercent: _f$priceChangePercent,
    #high: _f$high,
    #low: _f$low,
    #volume: _f$volume,
    #imageUrl: _f$imageUrl,
  };

  static TickerDTO _instantiate(DecodingData data) {
    return TickerDTO(
      symbol: data.dec(_f$symbol),
      currentPrice: data.dec(_f$currentPrice),
      priceChange: data.dec(_f$priceChange),
      priceChangePercent: data.dec(_f$priceChangePercent),
      high: data.dec(_f$high),
      low: data.dec(_f$low),
      volume: data.dec(_f$volume),
      imageUrl: data.dec(_f$imageUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TickerDTO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TickerDTO>(map);
  }

  static TickerDTO fromJson(String json) {
    return ensureInitialized().decodeJson<TickerDTO>(json);
  }
}

mixin TickerDTOMappable {
  String toJson() {
    return TickerDTOMapper.ensureInitialized().encodeJson<TickerDTO>(
      this as TickerDTO,
    );
  }

  Map<String, dynamic> toMap() {
    return TickerDTOMapper.ensureInitialized().encodeMap<TickerDTO>(
      this as TickerDTO,
    );
  }

  TickerDTOCopyWith<TickerDTO, TickerDTO, TickerDTO> get copyWith =>
      _TickerDTOCopyWithImpl<TickerDTO, TickerDTO>(
        this as TickerDTO,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TickerDTOMapper.ensureInitialized().stringifyValue(
      this as TickerDTO,
    );
  }

  @override
  bool operator ==(Object other) {
    return TickerDTOMapper.ensureInitialized().equalsValue(
      this as TickerDTO,
      other,
    );
  }

  @override
  int get hashCode {
    return TickerDTOMapper.ensureInitialized().hashValue(this as TickerDTO);
  }
}

extension TickerDTOValueCopy<$R, $Out> on ObjectCopyWith<$R, TickerDTO, $Out> {
  TickerDTOCopyWith<$R, TickerDTO, $Out> get $asTickerDTO =>
      $base.as((v, t, t2) => _TickerDTOCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TickerDTOCopyWith<$R, $In extends TickerDTO, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? symbol,
    String? currentPrice,
    String? priceChange,
    String? priceChangePercent,
    String? high,
    String? low,
    String? volume,
    String? imageUrl,
  });
  TickerDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TickerDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TickerDTO, $Out>
    implements TickerDTOCopyWith<$R, TickerDTO, $Out> {
  _TickerDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TickerDTO> $mapper =
      TickerDTOMapper.ensureInitialized();
  @override
  $R call({
    String? symbol,
    String? currentPrice,
    String? priceChange,
    String? priceChangePercent,
    String? high,
    String? low,
    String? volume,
    Object? imageUrl = $none,
  }) => $apply(
    FieldCopyWithData({
      if (symbol != null) #symbol: symbol,
      if (currentPrice != null) #currentPrice: currentPrice,
      if (priceChange != null) #priceChange: priceChange,
      if (priceChangePercent != null) #priceChangePercent: priceChangePercent,
      if (high != null) #high: high,
      if (low != null) #low: low,
      if (volume != null) #volume: volume,
      if (imageUrl != $none) #imageUrl: imageUrl,
    }),
  );
  @override
  TickerDTO $make(CopyWithData data) => TickerDTO(
    symbol: data.get(#symbol, or: $value.symbol),
    currentPrice: data.get(#currentPrice, or: $value.currentPrice),
    priceChange: data.get(#priceChange, or: $value.priceChange),
    priceChangePercent: data.get(
      #priceChangePercent,
      or: $value.priceChangePercent,
    ),
    high: data.get(#high, or: $value.high),
    low: data.get(#low, or: $value.low),
    volume: data.get(#volume, or: $value.volume),
    imageUrl: data.get(#imageUrl, or: $value.imageUrl),
  );

  @override
  TickerDTOCopyWith<$R2, TickerDTO, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TickerDTOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

