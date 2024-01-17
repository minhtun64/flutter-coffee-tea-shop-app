import 'package:flutter/material.dart';

import 'screens/bottomTabsNavigation/bottomTabsNavigation.dart';
import 'screens/login/login_screen.dart';
import 'screens/product/product_screen.dart';
import 'screens/register/register_screen.dart';
import 'utils/common_widgets/invalid_route.dart';
import 'values/app_routes.dart';

class Routes {
  const Routes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.login:
        return getRoute(widget: const LoginPage());

      case AppRoutes.register:
        return getRoute(widget: const RegisterPage());

      case AppRoutes.navigate_home:
        return getRoute(widget: BottomTabsNavigation(currentPageIndex: 0));

      // case AppRoutes.product:
      //   return getRoute(widget: ProductPage());

      /// An invalid route. User shouldn't see this,
      /// it's for debugging purpose only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
