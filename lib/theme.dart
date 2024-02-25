import 'package:flutter/material.dart';

class AppColors {
  bool isDark = false;
  get brightness => isDark ? Brightness.dark : Brightness.light;
  get defaultBackground => isDark ? Colors.grey.shade700 : Colors.white;
  get secBackground => isDark ? Colors.grey.shade800 : Colors.grey.shade200;
  get defaultText => isDark ? Colors.white : Colors.black;
  get secText => isDark ? Colors.black : Colors.white;
  get greyText => isDark ? Colors.grey.shade400 : Colors.grey.shade700;
  get defaultBtnColor => isDark ? Colors.white : Colors.black;
  get accentGrey => Colors.grey;
  get defaultLine => Colors.grey.shade400;
}

ThemeData get themeData {
  final colors = AppColors();

  return ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Inter',
    brightness: colors.brightness,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: colors.brightness,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: colors.defaultBackground,
      foregroundColor: colors.defaultText,
      titleSpacing: 0,
      surfaceTintColor: colors.defaultBackground,
    ),
    iconTheme: IconThemeData(
      size: 32,
      color: colors.defaultText,
    ),
    cardTheme: CardTheme(
      color: colors.secBackground,
      surfaceTintColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: colors.defaultBackground,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300),
    ).apply(
      bodyColor: colors.defaultText,
      displayColor: colors.defaultText,
    ),
  );
}
