import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/core/constants/app_colors.dart';

/// TextTheme Extension
extension TextThemingExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

/// Theme Extension
extension AppThemeExtension on BuildContext {
  /// Check if current theme is dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// scaffold background color based on theme
  Color get scaffoldBackgroundColor =>
      isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight;

  /// Container background color based on theme
  Color get containerColor =>
      isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight;

  /// Card background color based on theme
  Color get cardColor =>
      isDarkMode ? AppColors.surfaceDark : AppColors.surfaceLight;

  /// Chips background color based on theme
  Color get chipsColor => isDarkMode
      ? AppColors.surfaceDark.withValues(alpha: 0.7)
      : AppColors.surfaceLight.withValues(alpha: 0.5);

  /// Reverse background (dark -> white, light -> dark)
  Color get reverseBackground =>
      isDarkMode ? AppColors.backgroundLight : AppColors.backgroundDark;

  /// Reverse bottom nav icon (dark -> white, light -> dark)
  Color get bottomNavIconColor =>
      isDarkMode ? AppColors.backgroundLight : AppColors.unselectBottomNavIcon;

  /// Current theme's color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// primary color shortcut
  Color get primaryColor => AppColors.primaryColor;

  /// secondary color shortcut
  Color get secondaryColor => AppColors.secondaryColor;
}

/// Status Bar Extension
extension StatusBarExtension on BuildContext {
  void setStatusBarTheme() {
    final brightness =
        MediaQuery.maybeOf(this)?.platformBrightness ?? Brightness.light;
    final bool isDark = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
