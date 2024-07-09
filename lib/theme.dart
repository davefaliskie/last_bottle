import 'package:flutter/material.dart';

ThemeData get themeData {
  return ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleSpacing: 0,
      surfaceTintColor: Colors.white,
    ),
    iconTheme: const IconThemeData(
      size: 32,
      color: Colors.black,
    ),
    cardTheme: CardTheme(
      color: Colors.grey.shade200,
      surfaceTintColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300),
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
  );
}

final primaryButtonStyle = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(Colors.blue.shade900),
);
