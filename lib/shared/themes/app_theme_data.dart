// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/color/app_colors.dart';

abstract class AppTheme {
  static ColorScheme lightColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.pureBlack,
      onPrimary: AppColor.pureWhite,
      primaryContainer: AppColor.grey200,
      onPrimaryContainer: AppColor.grey900,
      primaryFixed: AppColor.grey300,
      primaryFixedDim: AppColor.grey400,
      onPrimaryFixed: AppColor.grey900,
      onPrimaryFixedVariant: AppColor.grey700,
      secondary: AppColor.darkGrey,
      onSecondary: AppColor.pureWhite,
      secondaryContainer: AppColor.grey300,
      onSecondaryContainer: AppColor.grey800,
      secondaryFixed: AppColor.grey200,
      secondaryFixedDim: AppColor.grey300,
      onSecondaryFixed: AppColor.grey900,
      onSecondaryFixedVariant: AppColor.grey700,
      tertiary: AppColor.redAccent,
      onTertiary: AppColor.pureWhite,
      tertiaryContainer: AppColor.grey200,
      onTertiaryContainer: AppColor.grey800,
      tertiaryFixed: AppColor.grey300,
      tertiaryFixedDim: AppColor.grey400,
      onTertiaryFixed: AppColor.grey900,
      onTertiaryFixedVariant: AppColor.grey700,
      error: AppColor.error,
      onError: AppColor.pureWhite,
      errorContainer: AppColor.grey300,
      onErrorContainer: AppColor.grey900,
      surface: AppColor.pureWhite,
      onSurface: AppColor.pureBlack,
      surfaceDim: AppColor.grey100,
      surfaceBright: AppColor.pureWhite,
      surfaceContainerLowest: AppColor.pureWhite,
      surfaceContainerLow: AppColor.grey50,
      surfaceContainer: AppColor.grey100,
      surfaceContainerHigh: AppColor.grey200,
      surfaceContainerHighest: AppColor.grey300,
      onSurfaceVariant: AppColor.grey700,
      outline: AppColor.lightGrey,
      outlineVariant: AppColor.grey400,
      shadow: AppColor.grey700,
      scrim: Color(0x99000000),
      inverseSurface: AppColor.grey900,
      onInverseSurface: AppColor.grey100,
      inversePrimary: AppColor.grey300,
      surfaceTint: AppColor.grey900,
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      colorScheme: lightColorScheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.pureBlack,
          foregroundColor: AppColor.pureWhite,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          elevation: 4,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: AppColor.pureBlack,
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
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColor.pureBlack,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
