import 'package:fapp_setup/core/global_entities/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

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

  factory UserModel.fromFirebaseAuthUser(fa.User? user) {
    return UserModel(
      id: user?.uid,
      name: user?.displayName,
      email: user?.email,
      picture: user?.photoURL,
    );
  }
}
