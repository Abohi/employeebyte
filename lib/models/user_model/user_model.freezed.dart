// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {required DateTime? dateOfBirth,
      required String? address,
      required String? country,
      required String? state,
      required String? sex,
      required String? firstName,
      required String? lastName,
      required String? photo}) {
    return _UserModel(
      dateOfBirth: dateOfBirth,
      address: address,
      country: country,
      state: state,
      sex: sex,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
    );
  }

  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get sex => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime? dateOfBirth,
      String? address,
      String? country,
      String? state,
      String? sex,
      String? firstName,
      String? lastName,
      String? photo});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? dateOfBirth = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? sex = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? dateOfBirth,
      String? address,
      String? country,
      String? state,
      String? sex,
      String? firstName,
      String? lastName,
      String? photo});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? dateOfBirth = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? sex = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? photo = freezed,
  }) {
    return _then(_UserModel(
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required this.dateOfBirth,
      required this.address,
      required this.country,
      required this.state,
      required this.sex,
      required this.firstName,
      required this.lastName,
      required this.photo});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

  @override
  final DateTime? dateOfBirth;
  @override
  final String? address;
  @override
  final String? country;
  @override
  final String? state;
  @override
  final String? sex;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? photo;

  @override
  String toString() {
    return 'UserModel(dateOfBirth: $dateOfBirth, address: $address, country: $country, state: $state, sex: $sex, firstName: $firstName, lastName: $lastName, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                const DeepCollectionEquality()
                    .equals(other.dateOfBirth, dateOfBirth)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dateOfBirth) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(photo);

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required DateTime? dateOfBirth,
      required String? address,
      required String? country,
      required String? state,
      required String? sex,
      required String? firstName,
      required String? lastName,
      required String? photo}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  String? get state => throw _privateConstructorUsedError;
  @override
  String? get sex => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get photo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
