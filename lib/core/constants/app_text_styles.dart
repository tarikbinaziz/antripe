


import 'package:flutter/material.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/core.dart';

class AppTextStyles {
  static const String fontFamily = 'Montserrat';


  /// Light theme text (lazy to allow ScreenUtil to initialize first)
  static TextTheme get lightTextTheme => TextTheme(
    displayLarge: TextStyle(
      fontSize: 57.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceLight,
    ),
    displayMedium: TextStyle(
      fontSize: 45.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceLight,
    ),
    displaySmall: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceLight,
    ),

    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceLight,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceLight,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceLight,
    ),

    titleLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.onSurfaceLight,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.onSurfaceLight,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.onSurfaceLight,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,

      color: AppColors.onSurfaceLight,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,

      color: AppColors.onSurfaceLight,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,

      color: AppColors.onSurfaceLight,
    ),

    labelLarge: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.primaryColor,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.onSurfaceLight,
    ),
    labelSmall: TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.onSurfaceLight,
    ),
  );

  /// Dark theme text (lazy to allow ScreenUtil to initialize first)
  static TextTheme get darkTextTheme => TextTheme(
    displayLarge: TextStyle(
      fontSize: 57.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceDark,
    ),
    displayMedium: TextStyle(
      fontSize: 45.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceDark,
    ),
    displaySmall: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceDark,
    ),

    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceDark,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceDark,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.onSurfaceDark,
    ),

    titleLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.onSurfaceDark,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.onSurfaceDark,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.onSurfaceDark,
    ),

    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,

      color: AppColors.onSurfaceDark,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,

      color: AppColors.onSurfaceDark,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,

      color: AppColors.onSurfaceDark,
    ),

    labelLarge: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.primaryColor,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.onSurfaceDark,
    ),
    labelSmall: TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,

      color: AppColors.onSurfaceDark,
    ),
  );
}
