import 'package:auto_route/auto_route.dart';
import 'package:fapp_setup/services/app_routes/app_routes.gr.dart';

@AutoRouterConfig()
final class AppRoutes extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: '/home',
        ),
        AutoRoute(
          page: AuthorizationRoute.page,
          path: '/authentication',
        ),
      ];
}
