// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountriesModel _$_$_CountriesModelFromJson(Map<String, dynamic> json) {
  return _$_CountriesModel(
    result: (json['result'] as List<dynamic>?)
        ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    code: json['code'] as num?,
  );
}

Map<String, dynamic> _$_$_CountriesModelToJson(_$_CountriesModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
    };
