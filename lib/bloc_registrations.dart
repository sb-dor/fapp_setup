import 'package:fapp_setup/core/settings/app_lang/app_lang_cubit.dart';
import 'package:fapp_setup/core/settings/app_theme/app_theme_cubit.dart';
import 'package:fapp_setup/features/auth/view/bloc/auth_bloc.dart';
import 'package:fapp_setup/features/internet_connection/bloc/internet_connection_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injections/injections.dart';

abstract final class BlocRegistrations {
  static final providers = <BlocProvider>[
    BlocProvider<AppLangCubit>(
      create: (_) => AppLangCubit(),
    ),
    BlocProvider<AppThemeCubit>(
      create: (_) => AppThemeCubit(),
    ),
    BlocProvider<InternetConnectionBloc>(
      create: (_) => InternetConnectionBloc(),
    ),
    BlocProvider<AuthBloc>(
      create: (_) => serviceLocator<AuthBloc>(),
    ),
  ];
}
