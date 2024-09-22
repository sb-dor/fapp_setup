import 'package:fapp_setup/core/settings/dio_helper/dio_helper.dart';
import 'package:fapp_setup/injections/injections.dart';
import 'package:fapp_setup/services/dotenv/dotenv_helper.dart';
import 'package:fapp_setup/services/flutter_toast_service/flutter_toast_service.dart';
import 'package:fapp_setup/services/shared_prefer/shared_prefer.dart';
import 'package:fapp_setup/utils/reusable_functions.dart';

abstract final class UtilsInjections {
  static Future<void> inject() async {
    //
    serviceLocator.registerLazySingleton<SharedPreferHelper>(
      () => SharedPreferHelper(),
    );

    await serviceLocator<SharedPreferHelper>().initPref();

    serviceLocator.registerLazySingleton<DotEnvHelper>(
      () => DotEnvHelper(),
    );

    serviceLocator.registerLazySingleton<DioHelper>(
      () => DioHelper(),
    );

    serviceLocator.registerLazySingleton<FlutterToastService>(
      () => FlutterToastService(),
    );

    serviceLocator.registerLazySingleton<ReusableFunctions>(
      () => ReusableFunctions(),
    );
  }
}
