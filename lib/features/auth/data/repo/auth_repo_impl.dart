import 'package:fapp_setup/core/global_entities/entities/user.dart';
import 'package:fapp_setup/features/auth/data/sources/auth_data_source.dart';
import 'package:fapp_setup/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepoImpl(this._authDataSource);

  @override
  Future<User?> auth() => _authDataSource.auth();
//
}
