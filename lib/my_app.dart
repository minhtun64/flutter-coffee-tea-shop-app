import 'package:flutter/material.dart';

import 'routes.dart';
import 'utils/helpers/navigation_helper.dart';
import 'utils/helpers/snackbar_helper.dart';
import 'values/app_routes.dart';
import 'values/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.product,
      scaffoldMessengerKey: SnackbarHelper.key,
      navigatorKey: NavigationHelper.key,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
