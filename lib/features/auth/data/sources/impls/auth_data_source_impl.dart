import 'package:fapp_setup/core/global_entities/models/user_model/user_model.dart';
import 'package:fapp_setup/features/auth/data/sources/auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<UserModel?> auth() async {
    // auth logic
    return null;
  }
}
