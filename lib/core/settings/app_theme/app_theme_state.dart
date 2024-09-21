part of 'app_theme_cubit.dart';

@immutable
sealed class AppThemeState {
  final ThemeData themeData;

  const AppThemeState(this.themeData);
}

final class AppThemeInitial extends AppThemeState {
  const AppThemeInitial(super.themeData);
}
