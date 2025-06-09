import 'package:flutter/material.dart';
import '../app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    canvasColor: AppColors.blackColor,
    fontFamily: "Roboto",
    appBarTheme: const AppBarTheme(
      color: AppColors.blackColor,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(filled: true),
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.whiteColor,
      secondary: AppColors.whiteColor,
      surface: AppColors.blackColor,
      background: AppColors.blackColor,
    ),
    scaffoldBackgroundColor: AppColors.blackColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto",
        color: AppColors.whiteColor,
        fontSize: 28,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: "Roboto",
        color: AppColors.whiteColor,
        fontSize: 22,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: "Roboto",
        color: AppColors.whiteColor,
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto",
        color: AppColors.whiteColor,
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        color: AppColors.whiteColor,
        fontSize: 16,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto",
        color: AppColors.whiteColor,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: "Roboto",
        color: AppColors.whiteColor,
        fontSize: 13,
      ),
    ),
  );
}
