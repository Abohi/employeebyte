import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
class EmployeeModel with _$EmployeeModel{
  const factory EmployeeModel({ required DateTime? dateOfBirth,
    required String? address,required String? country,required String? state, required String? sex,
    required String? firstName, required String? lastName,required String? photo,required String? designation})=_EmployeeModel;
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

}
