import 'package:flutter/material.dart';

import 'app_colors.dart';

//light theme color scheme
final lightColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.blue,
);

//app general theme data
final themeData = ThemeData(
  colorScheme: lightColorScheme,
  brightness: Brightness.light,
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
  ),
  textTheme: TextTheme(
    displaySmall: ThemeData.light().textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.bold,
        ),
    titleLarge: ThemeData.light().textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
    bodySmall: ThemeData.light().textTheme.bodySmall!.copyWith(fontSize: 10),
  ),
);
