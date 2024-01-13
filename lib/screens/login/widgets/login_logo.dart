import 'package:flutter/material.dart';

import '../../../values/app_theme.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 40,
          child: Image.asset('assets/logo/brilicoffee_logo_outline.png',
              fit: BoxFit.cover),
        ),
        const SizedBox(width: 4),
        const Text(
          'Brili Coffee',
          style: AppTheme.brand_Large,
        )
      ],
    );
  }
}
