import 'package:auto_route/auto_route.dart';
import 'package:tectojp/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page), // remove in the future
        AutoRoute(page: HomeRoute.page, initial: true),
        // add new routes here
      ];
}
