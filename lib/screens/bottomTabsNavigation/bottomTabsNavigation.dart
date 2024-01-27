import 'package:flutter/material.dart';

import '../../models/notifications_model.dart';
import '../../values/app_colors.dart';
import '../../values/app_strings.dart';
import '../../values/app_theme.dart';
import '../account/account_screen.dart';
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
  List<NotificationsItem> item = notifications;
  int _unreadCount = 0;

  @override
  void initState() {
    super.initState();
    _updateUnreadCount();
  }

  void _updateUnreadCount() {
    setState(() {
      _unreadCount = notifications.where((n) => !n.isRead).length;
    });
  }

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
          destinations: <Widget>[
            const NavigationDestination(
              selectedIcon: IconTheme(
                  data: IconThemeData(
                    color: Colors.white,
                  ),
                  child: Icon(Icons.home)),
              icon: Icon(Icons.home_outlined),
              label: AppStrings.home,
            ),
            const NavigationDestination(
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
                data: const IconThemeData(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    const Icon(Icons.notifications),
                    if (_unreadCount > 0) ...[
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 8,
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          // child: Text(
                          //   _unreadCount.toString(),
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 8,
                          //   ),
                          // ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
              icon: Stack(
                children: [
                  const Icon(Icons.notifications_outlined),
                  if (_unreadCount > 0) ...[
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 8,
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        // child: Text(
                        //   _unreadCount.toString(),
                        //   style: const TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 8,
                        //   ),
                        // ),
                      ),
                    )
                  ]
                ],
              ),
              label: AppStrings.notifications,
            ),
            const NavigationDestination(
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
        const HomePage(),

        /// Order page
        const OrderPage(),

        /// Notifications page
        NotificationsPage(updateUnreadCount: _updateUnreadCount),

        /// Account page
        const AccountPage(),
      ][widget.currentPageIndex],
    );
  }
}
