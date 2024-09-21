part of 'app_lang_cubit.dart';

@immutable
sealed class AppLangState {
  final Locale locale;

  const AppLangState(this.locale);
}

final class AppLangInitial extends AppLangState {
  const AppLangInitial(super.locale);
}
