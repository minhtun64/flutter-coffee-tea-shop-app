import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color primaryColor = Color(0xff752E06);
  static const Color darkBrown = Color.fromARGB(255, 105, 49, 0);
  static const Color darkerBrown = Color.fromARGB(255, 70, 34, 1);
  static const Color darkestBrown = Color.fromARGB(255, 37, 18, 0);
  static const Color cardColor = Color.fromARGB(255, 221, 168, 137);
  static const Color scaffoldBackgroundColor = Color(0xffFCF8F6);

  static const List<Color> defaultGradient = [
    darkBrown,
    darkerBrown,
    darkestBrown,
  ];
}
