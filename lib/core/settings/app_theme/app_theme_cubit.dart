import 'package:fapp_setup/core/services/shared_prefer/shared_pref_constants.dart';
import 'package:fapp_setup/core/services/shared_prefer/shared_prefer.dart';
import 'package:fapp_setup/core/settings/app_theme/theme_settings.dart';
import 'package:fapp_setup/core/utils/constants.dart';
import 'package:fapp_setup/injections/injections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  final _sharedPrefer = serviceLocator<SharedPreferHelper>();

  AppThemeCubit() : super(AppThemeInitial(ThemeSettings.light));

  void initTheme() async {
    //
    final getTheme = _sharedPrefer.getStringByKey(
      key: SharedPreferConstants.appTheme,
    );

    if (getTheme == null) {
      return;
    }

    emit(AppThemeInitial(_getThemeByString(getTheme)));
  }

  void changeTheme() async {
    late String themeValue;
    //
    if (isDark) {
      themeValue = Constants.light;
      emit(AppThemeInitial(ThemeSettings.light));
    } else {
      themeValue = Constants.dark;
      emit(AppThemeInitial(ThemeSettings.dark));
    }

    await _sharedPrefer.saveString(
      key: SharedPreferConstants.appTheme,
      value: themeValue,
    );
  }

  ThemeData _getThemeByString(String theme) {
    if (theme == Constants.dark) {
      return ThemeSettings.dark;
    } else if (theme == Constants.light) {
      return ThemeSettings.light;
    } else {
      return ThemeSettings.light;
    }
  }

  bool get isLight => state.themeData.brightness == Brightness.light;

  bool get isDark => state.themeData.brightness == Brightness.dark;
}
