import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({ required DateTime? dateOfBirth,
    required String? address,required String? country,required String? state, required String? sex,
    required String? firstName, required String? lastName,required String? photo})=_UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

}
