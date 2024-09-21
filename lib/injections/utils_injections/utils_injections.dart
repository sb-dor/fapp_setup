import 'package:fapp_setup/injections/injections.dart';
import 'package:fapp_setup/services/shared_prefer/shared_prefer.dart';

abstract final class UtilsInjections {
  static Future<void> inject() async {
    //
    serviceLocator.registerLazySingleton<SharedPrefer>(
      () => SharedPrefer(),
    );

    await serviceLocator<SharedPrefer>().initPref();
  }
}
