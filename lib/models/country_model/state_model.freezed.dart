// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return _StateModel.fromJson(json);
}

/// @nodoc
class _$StateModelTearOff {
  const _$StateModelTearOff();

  _StateModel call({required String? code, required String? name}) {
    return _StateModel(
      code: code,
      name: name,
    );
  }

  StateModel fromJson(Map<String, Object> json) {
    return StateModel.fromJson(json);
  }
}

/// @nodoc
const $StateModel = _$StateModelTearOff();

/// @nodoc
mixin _$StateModel {
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateModelCopyWith<StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateModelCopyWith<$Res> {
  factory $StateModelCopyWith(
          StateModel value, $Res Function(StateModel) then) =
      _$StateModelCopyWithImpl<$Res>;
  $Res call({String? code, String? name});
}

/// @nodoc
class _$StateModelCopyWithImpl<$Res> implements $StateModelCopyWith<$Res> {
  _$StateModelCopyWithImpl(this._value, this._then);

  final StateModel _value;
  // ignore: unused_field
  final $Res Function(StateModel) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$StateModelCopyWith<$Res> implements $StateModelCopyWith<$Res> {
  factory _$StateModelCopyWith(
          _StateModel value, $Res Function(_StateModel) then) =
      __$StateModelCopyWithImpl<$Res>;
  @override
  $Res call({String? code, String? name});
}

/// @nodoc
class __$StateModelCopyWithImpl<$Res> extends _$StateModelCopyWithImpl<$Res>
    implements _$StateModelCopyWith<$Res> {
  __$StateModelCopyWithImpl(
      _StateModel _value, $Res Function(_StateModel) _then)
      : super(_value, (v) => _then(v as _StateModel));

  @override
  _StateModel get _value => super._value as _StateModel;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
  }) {
    return _then(_StateModel(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StateModel implements _StateModel {
  const _$_StateModel({required this.code, required this.name});

  factory _$_StateModel.fromJson(Map<String, dynamic> json) =>
      _$_$_StateModelFromJson(json);

  @override
  final String? code;
  @override
  final String? name;

  @override
  String toString() {
    return 'StateModel(code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StateModel &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$StateModelCopyWith<_StateModel> get copyWith =>
      __$StateModelCopyWithImpl<_StateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StateModelToJson(this);
  }
}

abstract class _StateModel implements StateModel {
  const factory _StateModel({required String? code, required String? name}) =
      _$_StateModel;

  factory _StateModel.fromJson(Map<String, dynamic> json) =
      _$_StateModel.fromJson;

  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StateModelCopyWith<_StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
