// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'countries_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) {
  return _CountriesModel.fromJson(json);
}

/// @nodoc
class _$CountriesModelTearOff {
  const _$CountriesModelTearOff();

  _CountriesModel call(
      {required List<CountryModel>? result, required num? code}) {
    return _CountriesModel(
      result: result,
      code: code,
    );
  }

  CountriesModel fromJson(Map<String, Object> json) {
    return CountriesModel.fromJson(json);
  }
}

/// @nodoc
const $CountriesModel = _$CountriesModelTearOff();

/// @nodoc
mixin _$CountriesModel {
  List<CountryModel>? get result => throw _privateConstructorUsedError;
  num? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountriesModelCopyWith<CountriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountriesModelCopyWith<$Res> {
  factory $CountriesModelCopyWith(
          CountriesModel value, $Res Function(CountriesModel) then) =
      _$CountriesModelCopyWithImpl<$Res>;
  $Res call({List<CountryModel>? result, num? code});
}

/// @nodoc
class _$CountriesModelCopyWithImpl<$Res>
    implements $CountriesModelCopyWith<$Res> {
  _$CountriesModelCopyWithImpl(this._value, this._then);

  final CountriesModel _value;
  // ignore: unused_field
  final $Res Function(CountriesModel) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
abstract class _$CountriesModelCopyWith<$Res>
    implements $CountriesModelCopyWith<$Res> {
  factory _$CountriesModelCopyWith(
          _CountriesModel value, $Res Function(_CountriesModel) then) =
      __$CountriesModelCopyWithImpl<$Res>;
  @override
  $Res call({List<CountryModel>? result, num? code});
}

/// @nodoc
class __$CountriesModelCopyWithImpl<$Res>
    extends _$CountriesModelCopyWithImpl<$Res>
    implements _$CountriesModelCopyWith<$Res> {
  __$CountriesModelCopyWithImpl(
      _CountriesModel _value, $Res Function(_CountriesModel) _then)
      : super(_value, (v) => _then(v as _CountriesModel));

  @override
  _CountriesModel get _value => super._value as _CountriesModel;

  @override
  $Res call({
    Object? result = freezed,
    Object? code = freezed,
  }) {
    return _then(_CountriesModel(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountriesModel implements _CountriesModel {
  const _$_CountriesModel({required this.result, required this.code});

  factory _$_CountriesModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CountriesModelFromJson(json);

  @override
  final List<CountryModel>? result;
  @override
  final num? code;

  @override
  String toString() {
    return 'CountriesModel(result: $result, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountriesModel &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$CountriesModelCopyWith<_CountriesModel> get copyWith =>
      __$CountriesModelCopyWithImpl<_CountriesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountriesModelToJson(this);
  }
}

abstract class _CountriesModel implements CountriesModel {
  const factory _CountriesModel(
      {required List<CountryModel>? result,
      required num? code}) = _$_CountriesModel;

  factory _CountriesModel.fromJson(Map<String, dynamic> json) =
      _$_CountriesModel.fromJson;

  @override
  List<CountryModel>? get result => throw _privateConstructorUsedError;
  @override
  num? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountriesModelCopyWith<_CountriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
