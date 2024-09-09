import 'package:flutter/material.dart';
import 'package:wall_envy/presentation/ui/utils/app_colors.dart';

class AppThemes {
  static ThemeData buildThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.appThemeColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
