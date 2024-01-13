import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_strings.dart';
import '../../values/app_theme.dart';
import '../account/accont_screen.dart';
import '../home/home_screen.dart';
import '../notifications/notifications_screen.dart';
import '../order/order_screen.dart';

// ignore: must_be_immutable
class BottomTabsNavigation extends StatefulWidget {
  int currentPageIndex = 0;

  BottomTabsNavigation({
    Key? key,
    required this.currentPageIndex,
  }) : super(key: key);

  @override
  State<BottomTabsNavigation> createState() => _NavigationState();
}

class _NavigationState extends State<BottomTabsNavigation> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? AppTheme.body_Small_Thin
                    : AppTheme.body_Small_Thin_Black,
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              widget.currentPageIndex = index;
            });
          },
          indicatorColor: AppColors.primaryColor,
          surfaceTintColor: Colors.white,
          selectedIndex: widget.currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: IconTheme(
                  data: IconThemeData(
                    color: Colors.white,
                  ),
                  child: Icon(Icons.home)),
              icon: Icon(Icons.home_outlined),
              label: AppStrings.home,
            ),
            NavigationDestination(
              selectedIcon: IconTheme(
                  data: IconThemeData(
                    color: Colors.white,
                  ),
                  child: Icon(Icons.delivery_dining)),
              icon: Icon(Icons.delivery_dining_outlined),
              label: AppStrings.order,
            ),
            NavigationDestination(
              selectedIcon: IconTheme(
                  data: IconThemeData(
                    color: Colors.white,
                  ),
                  child: Icon(Icons.notifications)),
              icon: Icon(Icons.notifications_outlined),
              label: AppStrings.notifications,
            ),
            NavigationDestination(
              selectedIcon: IconTheme(
                  data: IconThemeData(
                    color: Colors.white,
                  ),
                  child: Icon(Icons.person)),
              icon: Icon(Icons.person_outlined),
              label: AppStrings.account,
            ),
          ],
        ),
      ),
      body: <Widget>[
        /// Home page
        HomePage(),

        /// Order page
        const OrderPage(),

        /// Notifications page
        const NotificationsPage(),

        /// Account page
        const AccountPage(),
      ][widget.currentPageIndex],
    );
  }
}
