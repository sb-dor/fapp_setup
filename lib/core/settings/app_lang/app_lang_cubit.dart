import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'app_lang_state.dart';

class AppLangCubit extends Cubit<AppLangState> {
  AppLangCubit() : super(const AppLangInitial(Locale('ru')));

  void changeLocale(Locale locale) {
    emit(AppLangInitial(locale));
  }
}
