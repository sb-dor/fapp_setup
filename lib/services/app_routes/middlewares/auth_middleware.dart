import 'package:auto_route/auto_route.dart';
import 'package:fapp_setup/features/auth/view/bloc/auth_bloc.dart';
import 'package:fapp_setup/services/app_routes/app_routes.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AuthMiddleWare extends AutoRouteGuard {
  final PageInfo? pageInfo;

  AuthMiddleWare({this.pageInfo});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // rewrite auth logic here for checking auth middleware
    final authBloc = BlocProvider.of<AuthBloc>(
      router.navigatorKey.currentContext!,
    );

    if (authBloc.state is AuthenticatedState) {
      if (pageInfo != null) {
        resolver.redirect(const HomeRoute());
      } else {
        resolver.next();
      }
    } else {
      //
      resolver.redirect(
        const AuthorizationRoute(),
      );
    }
  }
}
