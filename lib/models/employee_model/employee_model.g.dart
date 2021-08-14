// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeModel _$_$_EmployeeModelFromJson(Map<String, dynamic> json) {
  return _$_EmployeeModel(
    dateOfBirth: json['dateOfBirth'] == null
        ? null
        : DateTime.parse(json['dateOfBirth'] as String),
    address: json['address'] as String?,
    country: json['country'] as String?,
    state: json['state'] as String?,
    sex: json['sex'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    photo: json['photo'] as String?,
    designation: json['designation'] as String?,
  );
}

Map<String, dynamic> _$_$_EmployeeModelToJson(_$_EmployeeModel instance) =>
    <String, dynamic>{
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'address': instance.address,
      'country': instance.country,
      'state': instance.state,
      'sex': instance.sex,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photo': instance.photo,
      'designation': instance.designation,
    };
