import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/constants/app_text_styles.dart';

class AppTheme {
  // Light Theme
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppTextStyles.fontFamily,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    canvasColor: AppColors.backgroundLight,
    hintColor: AppColors.hint,
    textTheme: AppTextStyles.lightTextTheme,
    appBarTheme: _appBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      overlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    ),
    cardTheme: _cardTheme(
      color: AppColors.surfaceLight,
      shadowColor: AppColors.boxShadow,
    ),
    elevatedButtonTheme: _elevatedButtonTheme(),
    inputDecorationTheme: _inputDecorationTheme(
      borderColor: AppColors.border,
      hintColor: AppColors.hint,
    ),
    bottomNavigationBarTheme: _bottomNavigationBarTheme(isDark: false),
    dialogTheme: _dialogTheme(isDark: false),
    dividerColor: AppColors.border,
  );

  // Dark Theme
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppTextStyles.fontFamily,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    canvasColor: AppColors.backgroundDark,
    hintColor: AppColors.mutedDark,
    textTheme: AppTextStyles.darkTextTheme,
    appBarTheme: _appBarTheme(
      backgroundColor: AppColors.surfaceDarkElevated,
      foregroundColor: AppColors.onSurfaceDark,
      overlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
    ),
    cardTheme: _cardTheme(
      color: AppColors.surfaceDark,
      shadowColor: Colors.black.withOpacity(0.45),
    ),
    elevatedButtonTheme: _elevatedButtonTheme(),
    inputDecorationTheme: _inputDecorationTheme(
      borderColor: AppColors.borderDark,
      hintColor: AppColors.mutedDark,
      fillColor: AppColors.surfaceDarkElevated,
    ),
    bottomNavigationBarTheme: _bottomNavigationBarTheme(isDark: true),
    dialogTheme: _dialogTheme(isDark: true),
    dividerColor: AppColors.borderDark,
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: AppColors.borderDark),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      fillColor: WidgetStateProperty.all(AppColors.primaryColor),
      checkColor: WidgetStateProperty.all(AppColors.white),
    ),
  );

  // Common AppBarTheme
  static AppBarTheme _appBarTheme({
    required Color backgroundColor,
    required Color foregroundColor,
    required SystemUiOverlayStyle overlayStyle,
  }) => AppBarTheme(
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    centerTitle: false,
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: overlayStyle,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: foregroundColor,
    ),
  );

  // Common CardTheme
  static CardThemeData _cardTheme({
    required Color color,
    required Color shadowColor,
  }) => CardThemeData(
    color: color,
    shadowColor: shadowColor,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 4,
    margin: const EdgeInsets.all(8),
  );

  // Common ElevatedButtonTheme
  static ElevatedButtonThemeData _elevatedButtonTheme() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );

  // Common InputDecorationTheme
  static InputDecorationTheme _inputDecorationTheme({
    required Color borderColor,
    required Color hintColor,
    Color? fillColor,
  }) => InputDecorationTheme(
    filled: fillColor != null,
    fillColor: fillColor,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
    ),
    hintStyle: TextStyle(color: hintColor),
  );

  static BottomNavigationBarThemeData _bottomNavigationBarTheme({
    required bool isDark,
  }) => BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 0,
    backgroundColor: isDark
        ? AppColors.surfaceDarkElevated
        : AppColors.surfaceLight,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: isDark
        ? AppColors.onSurfaceDark.withOpacity(0.7)
        : AppColors.unselectBottomNavIcon,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  );

  static DialogThemeData _dialogTheme({required bool isDark}) =>
      DialogThemeData(
        backgroundColor: isDark
            ? AppColors.surfaceDark
            : AppColors.surfaceLight,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: isDark
            ? AppTextStyles.darkTextTheme.titleLarge
            : AppTextStyles.lightTextTheme.titleLarge,
        contentTextStyle: isDark
            ? AppTextStyles.darkTextTheme.bodyMedium
            : AppTextStyles.lightTextTheme.bodyMedium,
      );

  // Light ColorScheme
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: AppColors.error,
    onError: Colors.white,
    surface: AppColors.surfaceLight,
    onSurface: AppColors.onSurfaceLight,
  );

  // Dark ColorScheme
  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: AppColors.error,
    onError: Colors.white,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.onSurfaceDark,
  );
}
