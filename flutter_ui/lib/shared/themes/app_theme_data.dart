import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color bloodRed = Color(0xFF8B0000); // Blood red for accent icons

  // =======================
  // Light Mode ColorScheme
  // =======================
  static ColorScheme lightColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,         // Primary text/icon color in light mode
      onPrimary: Colors.white,       // Text color on primary backgrounds
      secondary: Colors.white,       // Secondary backgrounds (e.g., buttons)
      onSecondary: Colors.black,     // Text color on secondary backgrounds
      surface: Colors.white,         // Cards, sheets, dialogs background
      onSurface: Colors.black,       // Text on surface backgrounds
      background: Colors.white,      // Scaffold background color
      onBackground: Colors.black,    // Main text color on background
      error: Colors.red,             // Standard error color
      onError: Colors.white,         // Text color on error backgrounds
    );
  }

  // =====================
  // Light Mode ThemeData
  // =====================
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      primaryColor: Colors.black,
      colorScheme: lightColorScheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,   // White button background
          foregroundColor: Colors.black,   // Black button text
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          elevation: 4,
          shadowColor: Colors.grey,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black54,
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      dividerColor: Colors.black26,
    );
  }

  // =======================
  // Dark Mode ColorScheme
  // =======================
  static ColorScheme darkColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.white,         // Primary text/icon color in dark mode
      onPrimary: Colors.black,       // Text color on primary backgrounds
      secondary: Colors.black,       // Secondary backgrounds (e.g., buttons)
      onSecondary: Colors.white,     // Text color on secondary backgrounds
      surface: Colors.black,         // Cards, sheets, dialogs background
      onSurface: Colors.white,       // Text on surface backgrounds
      background: Colors.black,      // Scaffold background color
      onBackground: Colors.white,    // Main text color on background
      error: Colors.red,             // Standard error color
      onError: Colors.white,         // Text color on error backgrounds
    );
  }

  // ====================
  // Dark Mode ThemeData
  // ====================
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.black,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      primaryColor: Colors.white,
      colorScheme: darkColorScheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,   // Black button background
          foregroundColor: Colors.white,   // White button text
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          elevation: 4,
          shadowColor: Colors.grey,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.white24,
    );
  }

  // ====================
  // Blood Red Icon Theme
  // ====================
  static IconThemeData bloodRedIconTheme() {
    return const IconThemeData(color: bloodRed);
  }
}
