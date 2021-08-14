// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return _CountryModel.fromJson(json);
}

/// @nodoc
class _$CountryModelTearOff {
  const _$CountryModelTearOff();

  _CountryModel call(
      {required List<StateModel>? states,
      required String? name,
      required String? code}) {
    return _CountryModel(
      states: states,
      name: name,
      code: code,
    );
  }

  CountryModel fromJson(Map<String, Object> json) {
    return CountryModel.fromJson(json);
  }
}

/// @nodoc
const $CountryModel = _$CountryModelTearOff();

/// @nodoc
mixin _$CountryModel {
  List<StateModel>? get states => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryModelCopyWith<CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
          CountryModel value, $Res Function(CountryModel) then) =
      _$CountryModelCopyWithImpl<$Res>;
  $Res call({List<StateModel>? states, String? name, String? code});
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res> implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._value, this._then);

  final CountryModel _value;
  // ignore: unused_field
  final $Res Function(CountryModel) _then;

  @override
  $Res call({
    Object? states = freezed,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      states: states == freezed
          ? _value.states
          : states // ignore: cast_nullable_to_non_nullable
              as List<StateModel>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CountryModelCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$CountryModelCopyWith(
          _CountryModel value, $Res Function(_CountryModel) then) =
      __$CountryModelCopyWithImpl<$Res>;
  @override
  $Res call({List<StateModel>? states, String? name, String? code});
}

/// @nodoc
class __$CountryModelCopyWithImpl<$Res> extends _$CountryModelCopyWithImpl<$Res>
    implements _$CountryModelCopyWith<$Res> {
  __$CountryModelCopyWithImpl(
      _CountryModel _value, $Res Function(_CountryModel) _then)
      : super(_value, (v) => _then(v as _CountryModel));

  @override
  _CountryModel get _value => super._value as _CountryModel;

  @override
  $Res call({
    Object? states = freezed,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_CountryModel(
      states: states == freezed
          ? _value.states
          : states // ignore: cast_nullable_to_non_nullable
              as List<StateModel>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryModel implements _CountryModel {
  const _$_CountryModel(
      {required this.states, required this.name, required this.code});

  factory _$_CountryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryModelFromJson(json);

  @override
  final List<StateModel>? states;
  @override
  final String? name;
  @override
  final String? code;

  @override
  String toString() {
    return 'CountryModel(states: $states, name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryModel &&
            (identical(other.states, states) ||
                const DeepCollectionEquality().equals(other.states, states)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(states) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$CountryModelCopyWith<_CountryModel> get copyWith =>
      __$CountryModelCopyWithImpl<_CountryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryModelToJson(this);
  }
}

abstract class _CountryModel implements CountryModel {
  const factory _CountryModel(
      {required List<StateModel>? states,
      required String? name,
      required String? code}) = _$_CountryModel;

  factory _CountryModel.fromJson(Map<String, dynamic> json) =
      _$_CountryModel.fromJson;

  @override
  List<StateModel>? get states => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CountryModelCopyWith<_CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
