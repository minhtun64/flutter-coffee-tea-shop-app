// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static const textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: Colors.grey, width: 1.6),
  );

  static final ThemeData themeData = ThemeData(
    fontFamily: 'Lexend',
    useMaterial3: true,
    colorSchemeSeed: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Lexend',
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 34,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Lexend',
        color: Colors.grey,
        fontSize: 14,
        letterSpacing: 0.5,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      errorStyle: TextStyle(fontSize: 12),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      border: textFormFieldBorder,
      errorBorder: textFormFieldBorder,
      focusedBorder: textFormFieldBorder,
      focusedErrorBorder: textFormFieldBorder,
      enabledBorder: textFormFieldBorder,
      labelStyle: TextStyle(
        fontFamily: 'Lexend',
        fontSize: 17,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.all(4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        textStyle:
            const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 50),
        side: BorderSide(color: Colors.grey.shade200),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        disabledBackgroundColor: Colors.grey.shade300,
        minimumSize: const Size(double.infinity, 52),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Lexend',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );

  static const TextStyle brand_Large = TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: 'Lexend',
  );

  static const TextStyle title_Large = TextStyle(
    fontFamily: 'Lexend',
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 34,
    letterSpacing: 0.5,
  );

  static const TextStyle body_Small = TextStyle(
    fontFamily: 'Lexend',
    color: Colors.grey,
    letterSpacing: 0.5,
  );

  static const TextStyle body_SuperSmall_Thin = TextStyle(
    fontFamily: 'Lexend',
    color: Colors.black,
    fontSize: 12,
  );

  static const TextStyle body_Small_Bold_Black = TextStyle(
    fontFamily: 'Lexend',
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle body_Small_Bold = TextStyle(
    fontFamily: 'Lexend',
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const TextStyle body_Small_Thin = TextStyle(
    fontFamily: 'Lexend',
    color: AppColors.primaryColor,
    fontSize: 14,
  );

  static const TextStyle body_Small_Thin_Black = TextStyle(
    fontFamily: 'Lexend',
    color: Colors.black,
    fontSize: 14,
  );

  static const TextStyle body_Small_Thin_Black_LineThrough = TextStyle(
    fontFamily: 'Lexend',
    color: Colors.black,
    fontSize: 14,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle body_Medium_Bold_Black = TextStyle(
    fontFamily: 'Lexend',
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body_Small_Bold_Red = TextStyle(
    fontFamily: 'Lexend',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  static const TextStyle body_Small_Thin_White_Underline = TextStyle(
    fontFamily: 'Lexend',
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    decorationThickness: 0.5,
  );

  static const TextStyle body_Medium_Thin_Grey = TextStyle(
    fontFamily: 'Lexend',
    fontSize: 16,
    color: Colors.grey,
  );

  static const TextStyle body_Medium_Bold = TextStyle(
    fontFamily: 'Lexend',
    fontSize: 16,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body_Medium_Bold_White = TextStyle(
    fontFamily: 'Lexend',
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
