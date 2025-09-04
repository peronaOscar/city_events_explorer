import 'package:city_events_explorer/src/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Quicksand",
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: AppColors.surface),
        iconTheme: const IconThemeData(
        color: AppColors.black
        ),
      ),
      textTheme: textTheme,
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static final textTheme = const TextTheme(
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      labelMedium:  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.black,
        fontFamily: "Quicksand",
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 45,
        color: AppColors.black,
        fontFamily: "Quicksand",
      )
  );
}