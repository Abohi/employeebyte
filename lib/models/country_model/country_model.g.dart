// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryModel _$_$_CountryModelFromJson(Map<String, dynamic> json) {
  return _$_CountryModel(
    states: (json['states'] as List<dynamic>?)
        ?.map((e) => StateModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['name'] as String?,
    code: json['code'] as String?,
  );
}

Map<String, dynamic> _$_$_CountryModelToJson(_$_CountryModel instance) =>
    <String, dynamic>{
      'states': instance.states,
      'name': instance.name,
      'code': instance.code,
    };
