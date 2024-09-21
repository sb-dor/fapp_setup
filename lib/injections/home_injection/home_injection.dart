import 'package:fapp_setup/features/home/data/repo/home_repo_impl.dart';
import 'package:fapp_setup/features/home/data/sources/home_data_source.dart';
import 'package:fapp_setup/features/home/data/sources/impl/home_data_source_impl.dart';
import 'package:fapp_setup/features/home/domain/repo/home_repo.dart';
import 'package:fapp_setup/features/home/view/bloc/home_bloc.dart';
import 'package:fapp_setup/injections/injections.dart';

abstract final class HomeInjection {
  static Future<void> inject() async {
    //
    serviceLocator.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(),
    );

    serviceLocator.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(
        serviceLocator<HomeDataSource>(),
      ),
    );

    serviceLocator.registerFactory<HomeBloc>(
      () => HomeBloc(
        serviceLocator<HomeRepo>(),
      ),
    );
  }
}
