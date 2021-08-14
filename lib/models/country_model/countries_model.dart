import 'package:employeebyte/models/country_model/country_model.dart';
import 'package:employeebyte/models/country_model/state_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'countries_model.freezed.dart';
part 'countries_model.g.dart';

@freezed
class CountriesModel with _$CountriesModel{
  const factory CountriesModel({ required List<CountryModel>? result,required num? code})=_CountriesModel;
  factory CountriesModel.fromJson(Map<String, dynamic> json) => _$CountriesModelFromJson(json);
}