import 'package:employeebyte/models/country_model/state_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel with _$CountryModel{
  const factory CountryModel({ required List<StateModel>? states,required String? name,required String? code})=_CountryModel;
  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);

}