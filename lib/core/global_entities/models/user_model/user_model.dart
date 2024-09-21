import 'package:fapp_setup/core/global_entities/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel extends User with _$UserModel {
  factory UserModel({
    String? id,
    String? name,
    String? email,
    String? picture,
    String? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
