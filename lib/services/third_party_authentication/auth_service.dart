import 'package:fapp_setup/core/global_entities/entities/user.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthData {
  final String? email;
  final String? password;

  const AuthData({this.email, this.password});
}

abstract interface class AuthService {
  Future<User?> auth({AuthData? authData});

  Future<User?> checkAuth({AuthData? authData});
}