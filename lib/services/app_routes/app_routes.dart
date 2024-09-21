import 'package:auto_route/auto_route.dart';
import 'package:fapp_setup/services/app_routes/app_routes.gr.dart';
import 'package:fapp_setup/services/app_routes/middlewares/auth_middleware.dart';
import 'package:flutter/material.dart';

@AutoRouterConfig()
final class AppRoutes extends RootStackRouter {
  final BuildContext context;

  AppRoutes(this.context);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: '/home',
          guards: [AuthMiddleWare(context)],
        ),
        AutoRoute(
          page: AuthorizationRoute.page,
          path: '/authentication',
        ),
      ];
}
