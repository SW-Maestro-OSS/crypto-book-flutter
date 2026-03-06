// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'news_dto.dart';

class CryptoPanicResponseDTOMapper
    extends ClassMapperBase<CryptoPanicResponseDTO> {
  CryptoPanicResponseDTOMapper._();

  static CryptoPanicResponseDTOMapper? _instance;
  static CryptoPanicResponseDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CryptoPanicResponseDTOMapper._());
      CryptoPanicPostDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CryptoPanicResponseDTO';

  static List<CryptoPanicPostDTO>? _$results(CryptoPanicResponseDTO v) =>
      v.results;
  static const Field<CryptoPanicResponseDTO, List<CryptoPanicPostDTO>>
  _f$results = Field('results', _$results, opt: true);

  @override
  final MappableFields<CryptoPanicResponseDTO> fields = const {
    #results: _f$results,
  };

  static CryptoPanicResponseDTO _instantiate(DecodingData data) {
    return CryptoPanicResponseDTO(results: data.dec(_f$results));
  }

  @override
  final Function instantiate = _instantiate;

  static CryptoPanicResponseDTO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CryptoPanicResponseDTO>(map);
  }

  static CryptoPanicResponseDTO fromJson(String json) {
    return ensureInitialized().decodeJson<CryptoPanicResponseDTO>(json);
  }
}

mixin CryptoPanicResponseDTOMappable {
  String toJson() {
    return CryptoPanicResponseDTOMapper.ensureInitialized()
        .encodeJson<CryptoPanicResponseDTO>(this as CryptoPanicResponseDTO);
  }

  Map<String, dynamic> toMap() {
    return CryptoPanicResponseDTOMapper.ensureInitialized()
        .encodeMap<CryptoPanicResponseDTO>(this as CryptoPanicResponseDTO);
  }

  CryptoPanicResponseDTOCopyWith<
    CryptoPanicResponseDTO,
    CryptoPanicResponseDTO,
    CryptoPanicResponseDTO
  >
  get copyWith =>
      _CryptoPanicResponseDTOCopyWithImpl<
        CryptoPanicResponseDTO,
        CryptoPanicResponseDTO
      >(this as CryptoPanicResponseDTO, $identity, $identity);
  @override
  String toString() {
    return CryptoPanicResponseDTOMapper.ensureInitialized().stringifyValue(
      this as CryptoPanicResponseDTO,
    );
  }

  @override
  bool operator ==(Object other) {
    return CryptoPanicResponseDTOMapper.ensureInitialized().equalsValue(
      this as CryptoPanicResponseDTO,
      other,
    );
  }

  @override
  int get hashCode {
    return CryptoPanicResponseDTOMapper.ensureInitialized().hashValue(
      this as CryptoPanicResponseDTO,
    );
  }
}

extension CryptoPanicResponseDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CryptoPanicResponseDTO, $Out> {
  CryptoPanicResponseDTOCopyWith<$R, CryptoPanicResponseDTO, $Out>
  get $asCryptoPanicResponseDTO => $base.as(
    (v, t, t2) => _CryptoPanicResponseDTOCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CryptoPanicResponseDTOCopyWith<
  $R,
  $In extends CryptoPanicResponseDTO,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    CryptoPanicPostDTO,
    CryptoPanicPostDTOCopyWith<$R, CryptoPanicPostDTO, CryptoPanicPostDTO>
  >?
  get results;
  $R call({List<CryptoPanicPostDTO>? results});
  CryptoPanicResponseDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CryptoPanicResponseDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CryptoPanicResponseDTO, $Out>
    implements
        CryptoPanicResponseDTOCopyWith<$R, CryptoPanicResponseDTO, $Out> {
  _CryptoPanicResponseDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CryptoPanicResponseDTO> $mapper =
      CryptoPanicResponseDTOMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    CryptoPanicPostDTO,
    CryptoPanicPostDTOCopyWith<$R, CryptoPanicPostDTO, CryptoPanicPostDTO>
  >?
  get results => $value.results != null
      ? ListCopyWith(
          $value.results!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(results: v),
        )
      : null;
  @override
  $R call({Object? results = $none}) =>
      $apply(FieldCopyWithData({if (results != $none) #results: results}));
  @override
  CryptoPanicResponseDTO $make(CopyWithData data) =>
      CryptoPanicResponseDTO(results: data.get(#results, or: $value.results));

  @override
  CryptoPanicResponseDTOCopyWith<$R2, CryptoPanicResponseDTO, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CryptoPanicResponseDTOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CryptoPanicPostDTOMapper extends ClassMapperBase<CryptoPanicPostDTO> {
  CryptoPanicPostDTOMapper._();

  static CryptoPanicPostDTOMapper? _instance;
  static CryptoPanicPostDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CryptoPanicPostDTOMapper._());
      CryptoPanicSourceDTOMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CryptoPanicPostDTO';

  static String? _$title(CryptoPanicPostDTO v) => v.title;
  static const Field<CryptoPanicPostDTO, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );
  static String? _$url(CryptoPanicPostDTO v) => v.url;
  static const Field<CryptoPanicPostDTO, String> _f$url = Field(
    'url',
    _$url,
    opt: true,
  );
  static String? _$publishedAt(CryptoPanicPostDTO v) => v.publishedAt;
  static const Field<CryptoPanicPostDTO, String> _f$publishedAt = Field(
    'publishedAt',
    _$publishedAt,
    key: r'published_at',
    opt: true,
  );
  static CryptoPanicSourceDTO? _$source(CryptoPanicPostDTO v) => v.source;
  static const Field<CryptoPanicPostDTO, CryptoPanicSourceDTO> _f$source =
      Field('source', _$source, opt: true);

  @override
  final MappableFields<CryptoPanicPostDTO> fields = const {
    #title: _f$title,
    #url: _f$url,
    #publishedAt: _f$publishedAt,
    #source: _f$source,
  };

  static CryptoPanicPostDTO _instantiate(DecodingData data) {
    return CryptoPanicPostDTO(
      title: data.dec(_f$title),
      url: data.dec(_f$url),
      publishedAt: data.dec(_f$publishedAt),
      source: data.dec(_f$source),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CryptoPanicPostDTO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CryptoPanicPostDTO>(map);
  }

  static CryptoPanicPostDTO fromJson(String json) {
    return ensureInitialized().decodeJson<CryptoPanicPostDTO>(json);
  }
}

mixin CryptoPanicPostDTOMappable {
  String toJson() {
    return CryptoPanicPostDTOMapper.ensureInitialized()
        .encodeJson<CryptoPanicPostDTO>(this as CryptoPanicPostDTO);
  }

  Map<String, dynamic> toMap() {
    return CryptoPanicPostDTOMapper.ensureInitialized()
        .encodeMap<CryptoPanicPostDTO>(this as CryptoPanicPostDTO);
  }

  CryptoPanicPostDTOCopyWith<
    CryptoPanicPostDTO,
    CryptoPanicPostDTO,
    CryptoPanicPostDTO
  >
  get copyWith =>
      _CryptoPanicPostDTOCopyWithImpl<CryptoPanicPostDTO, CryptoPanicPostDTO>(
        this as CryptoPanicPostDTO,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CryptoPanicPostDTOMapper.ensureInitialized().stringifyValue(
      this as CryptoPanicPostDTO,
    );
  }

  @override
  bool operator ==(Object other) {
    return CryptoPanicPostDTOMapper.ensureInitialized().equalsValue(
      this as CryptoPanicPostDTO,
      other,
    );
  }

  @override
  int get hashCode {
    return CryptoPanicPostDTOMapper.ensureInitialized().hashValue(
      this as CryptoPanicPostDTO,
    );
  }
}

extension CryptoPanicPostDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CryptoPanicPostDTO, $Out> {
  CryptoPanicPostDTOCopyWith<$R, CryptoPanicPostDTO, $Out>
  get $asCryptoPanicPostDTO => $base.as(
    (v, t, t2) => _CryptoPanicPostDTOCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CryptoPanicPostDTOCopyWith<
  $R,
  $In extends CryptoPanicPostDTO,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  CryptoPanicSourceDTOCopyWith<$R, CryptoPanicSourceDTO, CryptoPanicSourceDTO>?
  get source;
  $R call({
    String? title,
    String? url,
    String? publishedAt,
    CryptoPanicSourceDTO? source,
  });
  CryptoPanicPostDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CryptoPanicPostDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CryptoPanicPostDTO, $Out>
    implements CryptoPanicPostDTOCopyWith<$R, CryptoPanicPostDTO, $Out> {
  _CryptoPanicPostDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CryptoPanicPostDTO> $mapper =
      CryptoPanicPostDTOMapper.ensureInitialized();
  @override
  CryptoPanicSourceDTOCopyWith<$R, CryptoPanicSourceDTO, CryptoPanicSourceDTO>?
  get source => $value.source?.copyWith.$chain((v) => call(source: v));
  @override
  $R call({
    Object? title = $none,
    Object? url = $none,
    Object? publishedAt = $none,
    Object? source = $none,
  }) => $apply(
    FieldCopyWithData({
      if (title != $none) #title: title,
      if (url != $none) #url: url,
      if (publishedAt != $none) #publishedAt: publishedAt,
      if (source != $none) #source: source,
    }),
  );
  @override
  CryptoPanicPostDTO $make(CopyWithData data) => CryptoPanicPostDTO(
    title: data.get(#title, or: $value.title),
    url: data.get(#url, or: $value.url),
    publishedAt: data.get(#publishedAt, or: $value.publishedAt),
    source: data.get(#source, or: $value.source),
  );

  @override
  CryptoPanicPostDTOCopyWith<$R2, CryptoPanicPostDTO, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CryptoPanicPostDTOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CryptoPanicSourceDTOMapper extends ClassMapperBase<CryptoPanicSourceDTO> {
  CryptoPanicSourceDTOMapper._();

  static CryptoPanicSourceDTOMapper? _instance;
  static CryptoPanicSourceDTOMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CryptoPanicSourceDTOMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CryptoPanicSourceDTO';

  static String? _$title(CryptoPanicSourceDTO v) => v.title;
  static const Field<CryptoPanicSourceDTO, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );
  static String? _$domain(CryptoPanicSourceDTO v) => v.domain;
  static const Field<CryptoPanicSourceDTO, String> _f$domain = Field(
    'domain',
    _$domain,
    opt: true,
  );

  @override
  final MappableFields<CryptoPanicSourceDTO> fields = const {
    #title: _f$title,
    #domain: _f$domain,
  };

  static CryptoPanicSourceDTO _instantiate(DecodingData data) {
    return CryptoPanicSourceDTO(
      title: data.dec(_f$title),
      domain: data.dec(_f$domain),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CryptoPanicSourceDTO fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CryptoPanicSourceDTO>(map);
  }

  static CryptoPanicSourceDTO fromJson(String json) {
    return ensureInitialized().decodeJson<CryptoPanicSourceDTO>(json);
  }
}

mixin CryptoPanicSourceDTOMappable {
  String toJson() {
    return CryptoPanicSourceDTOMapper.ensureInitialized()
        .encodeJson<CryptoPanicSourceDTO>(this as CryptoPanicSourceDTO);
  }

  Map<String, dynamic> toMap() {
    return CryptoPanicSourceDTOMapper.ensureInitialized()
        .encodeMap<CryptoPanicSourceDTO>(this as CryptoPanicSourceDTO);
  }

  CryptoPanicSourceDTOCopyWith<
    CryptoPanicSourceDTO,
    CryptoPanicSourceDTO,
    CryptoPanicSourceDTO
  >
  get copyWith =>
      _CryptoPanicSourceDTOCopyWithImpl<
        CryptoPanicSourceDTO,
        CryptoPanicSourceDTO
      >(this as CryptoPanicSourceDTO, $identity, $identity);
  @override
  String toString() {
    return CryptoPanicSourceDTOMapper.ensureInitialized().stringifyValue(
      this as CryptoPanicSourceDTO,
    );
  }

  @override
  bool operator ==(Object other) {
    return CryptoPanicSourceDTOMapper.ensureInitialized().equalsValue(
      this as CryptoPanicSourceDTO,
      other,
    );
  }

  @override
  int get hashCode {
    return CryptoPanicSourceDTOMapper.ensureInitialized().hashValue(
      this as CryptoPanicSourceDTO,
    );
  }
}

extension CryptoPanicSourceDTOValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CryptoPanicSourceDTO, $Out> {
  CryptoPanicSourceDTOCopyWith<$R, CryptoPanicSourceDTO, $Out>
  get $asCryptoPanicSourceDTO => $base.as(
    (v, t, t2) => _CryptoPanicSourceDTOCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CryptoPanicSourceDTOCopyWith<
  $R,
  $In extends CryptoPanicSourceDTO,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title, String? domain});
  CryptoPanicSourceDTOCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CryptoPanicSourceDTOCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CryptoPanicSourceDTO, $Out>
    implements CryptoPanicSourceDTOCopyWith<$R, CryptoPanicSourceDTO, $Out> {
  _CryptoPanicSourceDTOCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CryptoPanicSourceDTO> $mapper =
      CryptoPanicSourceDTOMapper.ensureInitialized();
  @override
  $R call({Object? title = $none, Object? domain = $none}) => $apply(
    FieldCopyWithData({
      if (title != $none) #title: title,
      if (domain != $none) #domain: domain,
    }),
  );
  @override
  CryptoPanicSourceDTO $make(CopyWithData data) => CryptoPanicSourceDTO(
    title: data.get(#title, or: $value.title),
    domain: data.get(#domain, or: $value.domain),
  );

  @override
  CryptoPanicSourceDTOCopyWith<$R2, CryptoPanicSourceDTO, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CryptoPanicSourceDTOCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

