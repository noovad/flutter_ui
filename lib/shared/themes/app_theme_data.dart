// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color pureBlack = Colors.black;
  static const Color darkGrey = Color(0xFF212121);
  static const Color mediumGrey = Color(0xFF616161);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color offWhite = Color(0xFFF5F5F5);
  static const Color pureWhite = Colors.white;

  static const Color grey900 = Color(0xFF212121);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey50 = Color(0xFFFAFAFA);

  static const Color redAccent = Color(0xFFFF5252);

  static ColorScheme lightColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: pureBlack,
      onPrimary: pureWhite,
      primaryContainer: grey200,
      onPrimaryContainer: grey900,
      primaryFixed: grey300,
      primaryFixedDim: grey400,
      onPrimaryFixed: grey900,
      onPrimaryFixedVariant: grey700,
      secondary: darkGrey,
      onSecondary: pureWhite,
      secondaryContainer: grey300,
      onSecondaryContainer: grey800,
      secondaryFixed: grey200,
      secondaryFixedDim: grey300,
      onSecondaryFixed: grey900,
      onSecondaryFixedVariant: grey700,
      tertiary: redAccent,
      onTertiary: pureWhite,
      tertiaryContainer: grey200,
      onTertiaryContainer: grey800,
      tertiaryFixed: grey300,
      tertiaryFixedDim: grey400,
      onTertiaryFixed: grey900,
      onTertiaryFixedVariant: grey700,
      error: darkGrey,
      onError: pureWhite,
      errorContainer: grey300,
      onErrorContainer: grey900,
      surface: pureWhite,
      onSurface: pureBlack,
      surfaceDim: grey100,
      surfaceBright: pureWhite,
      surfaceContainerLowest: pureWhite,
      surfaceContainerLow: grey50,
      surfaceContainer: grey100,
      surfaceContainerHigh: grey200,
      surfaceContainerHighest: grey300,
      onSurfaceVariant: grey700,
      outline: lightGrey,
      outlineVariant: grey400,
      shadow: grey700,
      scrim: Color(0x99000000),
      inverseSurface: grey900,
      onInverseSurface: grey100,
      inversePrimary: grey300,
      surfaceTint: grey900,
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      colorScheme: lightColorScheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: pureBlack,
          foregroundColor: pureWhite,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          elevation: 4,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: pureBlack,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.all(4),
          minimumSize: const Size(28, 28),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.withOpacity(0.25)),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.withOpacity(0.25))),
      ),
      tabBarTheme: const TabBarTheme(
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: pureBlack,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
