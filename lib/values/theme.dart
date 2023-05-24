import 'package:flutter/material.dart';
import 'app_colors.dart';

const appBarTheme = AppBarTheme(
  foregroundColor: AppColors.secondary,
  elevation: 0,
  iconTheme: IconThemeData(
    color: AppColors.primaryVariant,
  ),
);

const actionFloatingButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: AppColors.primaryVariant,
  foregroundColor: AppColors.secondary,
);

const textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  ),
  titleMedium: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  ),
  titleSmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  ),
  bodySmall: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
);

final theme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
