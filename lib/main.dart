import 'package:fapp_setup/core/app_lang/app_lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // other configurations here

  runApp(const _AppSettings());
}

class _AppSettings extends StatelessWidget {
  const _AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppLangCubit>(create: (_) => AppLangCubit()),
      ],
      child: _MainApp(),
    );
  }
}

// your app's name
class _MainApp extends StatelessWidget {
  const _MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final appLandCubit = context.watch<AppLangCubit>();

      return MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: appLandCubit.state.locale,
        supportedLocales: S.delegate.supportedLocales,
      );
    });
  }
}
