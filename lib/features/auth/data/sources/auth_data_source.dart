import 'package:fapp_setup/core/global_entities/models/user_model/user_model.dart';

abstract interface class AuthDataSource {
  Future<UserModel?> auth();
}
