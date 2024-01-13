import 'package:flutter/material.dart';

import '../../values/app_strings.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.account),
        ],
      ),
    );
  }
}
