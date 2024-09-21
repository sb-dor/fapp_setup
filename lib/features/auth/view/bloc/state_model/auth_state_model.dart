import 'package:fapp_setup/core/global_entities/entities/user.dart';

class AuthStateModel {
  User? _user;

  User? get user => _user;

  void setUser(User? user) => _user = user;
}
