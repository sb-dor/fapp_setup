import 'package:auto_route/auto_route.dart';
import 'app_routes.gr.dart';
import 'middlewares/auth_middleware.dart';

@AutoRouterConfig()
final class AppRoutes extends RootStackRouter {
  AppRoutes();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoadingRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          guards: [AuthMiddleWare()], // pageRouteInfo: HomeRoute()
        ),
        AutoRoute(
          page: AuthorizationRoute.page,
          path: '/authentication',
        ),
      ];
}
