import 'package:fapp_setup/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fapp_setup/features/auth/data/sources/auth_data_source.dart';
import 'package:fapp_setup/features/auth/data/sources/impls/auth_data_source_impl.dart';
import 'package:fapp_setup/features/auth/domain/repo/auth_repo.dart';
import 'package:fapp_setup/features/auth/view/bloc/auth_bloc.dart';
import 'package:fapp_setup/injections/injections.dart';

abstract final class AuthInjection {
  static Future<void> inject() async {
    //
    serviceLocator.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(),
    );

    serviceLocator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        serviceLocator<AuthDataSource>(),
      ),
    );

    serviceLocator.registerFactory<AuthBloc>(
      () => AuthBloc(
        serviceLocator<AuthRepo>(),
      ),
    );
  }
}
