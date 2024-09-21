import 'package:fapp_setup/core/global_entities/entities/user.dart';

abstract interface class AuthRepo {
  //
  Future<User?> auth();
}
