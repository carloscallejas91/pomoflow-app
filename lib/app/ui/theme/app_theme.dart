import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/theme/app_color_extensions.dart';
import 'package:pomoflow/app/ui/theme/app_colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightTextPrimary,
    error: AppColors.error,
    onError: AppColors.onError,
    secondary: AppColors.primary,
    onSecondary: AppColors.onPrimary,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiary,
  ),
  scaffoldBackgroundColor: AppColors.lightBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightBackground,
    foregroundColor: AppColors.lightTextPrimary,
    elevation: 0,
  ),
  cardTheme: const CardThemeData(
    color: AppColors.lightSurface,
    elevation: 2,
    shadowColor: Color(0x1A64748B),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: AppColors.lightTextSecondary),
    hintStyle: TextStyle(color: AppColors.lightTextSecondary),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.lightBorder)),
  ),
  extensions: const <ThemeExtension<dynamic>>[
    AppColorExtensions(
      onSuccess: AppColors.success,
      success: AppColors.onSuccess,
      warning: AppColors.warning,
      onWarning: AppColors.onWarning,
      gradientPrimary: AppColors.lightGradientPrimary,
      gradientSecondary: AppColors.lightGradientSecondary,
      gradientTertiary: AppColors.lightGradientTertiary,
    ),
  ],
);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkTextPrimary,
    error: AppColors.error,
    onError: AppColors.onError,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onPrimary,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.onTertiary,
  ),
  scaffoldBackgroundColor: AppColors.darkBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    foregroundColor: AppColors.darkTextPrimary,
    elevation: 0,
  ),
  cardTheme: const CardThemeData(color: AppColors.darkSurface, elevation: 2),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: AppColors.darkTextSecondary),
    hintStyle: TextStyle(color: AppColors.darkTextSecondary),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primary)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.darkBorder)),
  ),
  extensions: const <ThemeExtension<dynamic>>[
    AppColorExtensions(
      onSuccess: AppColors.success,
      success: AppColors.onSuccess,
      warning: AppColors.warning,
      onWarning: AppColors.onWarning,
      gradientPrimary: AppColors.darkGradientPrimary,
      gradientSecondary: AppColors.darkGradientSecondary,
      gradientTertiary: AppColors.darkGradientTertiary,
    ),
  ],
);
