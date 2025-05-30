// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color bloodRed = Color(0xFF8B0000);
  static const Color lightRed = Color(0xFFF88379);

  static const Color charcoal = Color(0xFF333333);
  static const Color darkGrey = Color(0xFF555555);
  static const Color mediumGrey = Color(0xFF888888);
  static const Color lightGrey = Color(0xFFCCCCCC);
  static const Color paleGrey = Color(0xFFF2F2F2);
  static const Color pureWhite = Color(0xFFFFFFFF);

  static ColorScheme lightColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: charcoal,
      onPrimary: pureWhite,
      secondary: bloodRed,
      onSecondary: pureWhite,
      surface: paleGrey,
      onSurface: charcoal,
      background: pureWhite,
      onBackground: charcoal,
      error: bloodRed,
      onError: pureWhite,
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: pureWhite,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      primaryColor: charcoal,
      colorScheme: lightColorScheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: pureWhite,
        elevation: 0,
        foregroundColor: charcoal,
        iconTheme: IconThemeData(color: charcoal),
        titleTextStyle: TextStyle(
            color: charcoal, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: charcoal,
          foregroundColor: pureWhite,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          elevation: 4,
          shadowColor: mediumGrey,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: bloodRed,
        unselectedLabelColor: mediumGrey,
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: bloodRed,
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
      iconTheme: const IconThemeData(color: charcoal),
      dividerColor: lightGrey,
      cardTheme: CardTheme(
        color: pureWhite,
        shadowColor: mediumGrey.withOpacity(0.3),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: bloodRed,
        foregroundColor: pureWhite,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(pureWhite),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return bloodRed;
          }
          return lightGrey;
        }),
      ),
    );
  }
}
