import 'package:flutter/material.dart';

import '../../values/app_strings.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.notifications),
        ],
      ),
    );
  }
}
