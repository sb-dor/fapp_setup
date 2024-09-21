import 'package:fapp_setup/bloc_registrations.dart';
import 'package:fapp_setup/core/settings/app_lang/app_lang_cubit.dart';
import 'package:fapp_setup/core/settings/app_theme/app_theme_cubit.dart';
import 'package:fapp_setup/features/auth/view/bloc/auth_bloc.dart';
import 'package:fapp_setup/features/internet_connection/bloc/internet_connection_bloc.dart';
import 'package:fapp_setup/injections/injections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_strategy/url_strategy.dart';

import 'generated/l10n.dart';
import 'services/app_routes/app_routes.dart';

final appConfig = AppRoutes();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // other configurations here
  if (kIsWeb) {
    setPathUrlStrategy();
  }

  await Injections.inject();

  runApp(const _AppSettings());
}

class _AppSettings extends StatelessWidget {
  const _AppSettings();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocRegistrations.providers,
      child: const _MainApp(),
    );
  }
}

// your app's name
class _MainApp extends StatelessWidget {
  const _MainApp();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final appLandCubit = context.watch<AppLangCubit>();
        final appTheme = context.watch<AppThemeCubit>();

        return MaterialApp.router(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: appLandCubit.state.locale,
          supportedLocales: S.delegate.supportedLocales,
          theme: appTheme.state.themeData,
          routerConfig: appConfig.config(),
        );
      },
    );
  }
}
