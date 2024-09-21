import 'package:fapp_setup/injections/auth_injection/auth_injection.dart';
import 'package:fapp_setup/injections/home_injection/home_injection.dart';
import 'package:fapp_setup/injections/utils_injections/utils_injections.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

abstract final class Injections {
  static Future<void> inject() async {
    //
    await UtilsInjections.inject();

    await AuthInjection.inject();

    await HomeInjection.inject();
  }
}
