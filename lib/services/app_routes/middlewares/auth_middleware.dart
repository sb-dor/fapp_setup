import 'package:auto_route/auto_route.dart';
import 'package:fapp_setup/features/auth/view/bloc/auth_bloc.dart';
import 'package:fapp_setup/services/app_routes/app_routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AuthMiddleWare extends AutoRouteGuard {
  final BuildContext context;

  AuthMiddleWare(this.context);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // rewrite auth logic here for checking auth middleware
    final authBloc = BlocProvider.of<AuthBloc>(context);

    if (authBloc.state is AuthenticatedState) {
      resolver.next();
    } else {
      //
      resolver.redirect(
        const AuthorizationRoute(),
      );
    }
  }
}
