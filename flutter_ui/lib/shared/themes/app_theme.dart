import "package:flutter/material.dart";
import "package:flutter_ui/shared/colors/app_colors.dart";
import "package:flutter_ui/shared/sizes/app_sizes.dart";
import "package:flutter_ui/shared/themes/app_text_style.dart";
abstract class AppTheme {
  static ColorScheme lightScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primer500,
      surfaceTint: AppColors.primer500,
      onPrimary: AppColors.sekunder700,
      primaryContainer: AppColors.primer100,
      onPrimaryContainer: AppColors.sekunder700,
      secondary: AppColors.sekunder600,
      onSecondary: AppColors.white1000,
      secondaryContainer: AppColors.sekunder100,
      onSecondaryContainer: AppColors.sekunder800,
      tertiary: Color(0xFF7D5260),
      onTertiary: AppColors.white1000,
      tertiaryContainer: Color(0xFFFFD8E4),
      onTertiaryContainer: Color(0xFF633B48),
      error: AppColors.danger500,
      onError: AppColors.white1000,
      errorContainer: AppColors.danger100,
      onErrorContainer: AppColors.danger800,
      surface: AppColors.white1000,
      onSurface: AppColors.neutral800,
      onSurfaceVariant: AppColors.neutral600,
      outline: AppColors.neutral400,
      outlineVariant: AppColors.neutral300,
      scrim: AppColors.black32,
      inverseSurface: AppColors.neutral800,
      onInverseSurface: AppColors.white1000,
      inversePrimary: AppColors.primer400,
      primaryFixed: AppColors.primer50,
      onPrimaryFixed: AppColors.primer800,
      primaryFixedDim: AppColors.primer200,
      onPrimaryFixedVariant: AppColors.primer700,
      secondaryFixed: AppColors.sekunder50,
      onSecondaryFixed: AppColors.sekunder800,
      secondaryFixedDim: AppColors.sekunder200,
      onSecondaryFixedVariant: AppColors.sekunder700,
      tertiaryFixed: Color(0xFFFFD8E4),
      onTertiaryFixed: Color(0xFF31111D),
      tertiaryFixedDim: Color(0xFFEFB8C8),
      onTertiaryFixedVariant: Color(0xFF633B48),
      surfaceContainer: AppColors.neutral200,
      surfaceContainerLow: AppColors.neutral50,
      surfaceContainerLowest: AppColors.white1000,
      surfaceContainerHigh: Color(0xFFFFF8E0),
      surfaceContainerHighest: Color(0xFFF6F8FA),
      surfaceDim: Color(0xFFFFF8E0),
      surfaceBright: Color(0xFFFFF8E0),
    );
  }

  static ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primer500,
      surfaceTint: AppColors.primer500,
      onPrimary: AppColors.sekunder700,
      primaryContainer: AppColors.primer100,
      onPrimaryContainer: AppColors.sekunder700,
      secondary: AppColors.sekunder600,
      onSecondary: AppColors.white1000,
      secondaryContainer: AppColors.sekunder100,
      onSecondaryContainer: AppColors.sekunder800,
      tertiary: Color(0xFF7D5260),
      onTertiary: AppColors.white1000,
      tertiaryContainer: Color(0xFFFFD8E4),
      onTertiaryContainer: Color(0xFF633B48),
      error: AppColors.danger500,
      onError: AppColors.white1000,
      errorContainer: AppColors.danger100,
      onErrorContainer: AppColors.danger800,
      surface: AppColors.white1000,
      onSurface: AppColors.neutral800,
      onSurfaceVariant: AppColors.neutral600,
      outline: AppColors.neutral400,
      outlineVariant: AppColors.neutral300,
      scrim: AppColors.black32,
      inverseSurface: AppColors.neutral800,
      onInverseSurface: AppColors.white1000,
      inversePrimary: AppColors.primer400,
      primaryFixed: AppColors.primer50,
      onPrimaryFixed: AppColors.primer800,
      primaryFixedDim: AppColors.primer200,
      onPrimaryFixedVariant: AppColors.primer700,
      secondaryFixed: AppColors.sekunder50,
      onSecondaryFixed: AppColors.sekunder800,
      secondaryFixedDim: AppColors.sekunder200,
      onSecondaryFixedVariant: AppColors.sekunder700,
      tertiaryFixed: Color(0xFFFFD8E4),
      onTertiaryFixed: Color(0xFF31111D),
      tertiaryFixedDim: Color(0xFFEFB8C8),
      onTertiaryFixedVariant: Color(0xFF633B48),
      surfaceContainer: AppColors.neutral200,
      surfaceContainerLow: AppColors.neutral50,
      surfaceContainerLowest: AppColors.white1000,
      surfaceContainerHigh: Color(0xFFFFF8E0),
      surfaceContainerHighest: Color(0xFFF6F8FA),
      surfaceDim: Color(0xFFFFF8E0),
      surfaceBright: Color(0xFFFFF8E0),
    );
  }

  static ThemeData dark() {
    return theme(darkScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: TextTheme(
        displayLarge: AppTextStyle.displayLarge,
        displayMedium: AppTextStyle.displayMedium,
        displaySmall: AppTextStyle.displaySmall,
        headlineLarge: AppTextStyle.headlineLarge,
        headlineMedium: AppTextStyle.headlineMedium,
        headlineSmall: AppTextStyle.headlineSmall,
        titleLarge: AppTextStyle.titleLarge,
        titleMedium: AppTextStyle.titleMedium,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodyMedium: AppTextStyle.bodyMedium,
        bodySmall: AppTextStyle.bodySmall,
        labelLarge: AppTextStyle.labelLarge,
        labelMedium: AppTextStyle.labelMedium,
        labelSmall: AppTextStyle.labelSmall,
      ).apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        labelTextStyle: WidgetStateProperty.fromMap(
          {
            WidgetState.selected: AppTextStyle.labelMediumProminent,
            WidgetState.disabled: AppTextStyle.labelMedium,
          },
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Color(0xFFFEFEFE),
        rangeSelectionBackgroundColor: AppColors.primer100,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Color(0xFFFEFEFE),
        dayPeriodColor: AppColors.sekunder100,
        dayPeriodTextColor: colorScheme.onSecondaryContainer,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: AppTextStyle.labelMedium.copyWith(
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
        unselectedLabelStyle: AppTextStyle.labelMedium.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.neutral600,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.fromMap(
            {
              WidgetState.disabled: colorScheme.outline,
              WidgetState.any: colorScheme.onPrimaryFixed,
            },
          ),
          iconColor: WidgetStateProperty.fromMap(
            {
              WidgetState.disabled: colorScheme.outline,
              WidgetState.any: colorScheme.onPrimaryFixed,
            },
          ),
          overlayColor: WidgetStateProperty.fromMap(
            {
              WidgetState.any: AppColors.primer600Opacity12,
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.fromMap(
            {
              WidgetState.disabled: colorScheme.outline,
              WidgetState.any: colorScheme.onPrimaryFixed,
            },
          ),
          iconColor: WidgetStateProperty.fromMap(
            {
              WidgetState.disabled: colorScheme.outline,
              WidgetState.any: colorScheme.onPrimaryFixed,
            },
          ),
          overlayColor: WidgetStateProperty.fromMap(
            {
              WidgetState.any: AppColors.primer600Opacity12,
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.fromMap(
            {
              WidgetState.disabled: colorScheme.outline,
              WidgetState.any: colorScheme.onPrimaryFixed,
            },
          ),
          iconColor: WidgetStateProperty.fromMap(
            {
              WidgetState.disabled: colorScheme.outline,
              WidgetState.any: colorScheme.onPrimaryFixed,
            },
          ),
          overlayColor: WidgetStateProperty.fromMap(
            {
              WidgetState.any: AppColors.primer600Opacity12,
            },
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        selectedColor: colorScheme.primaryContainer,
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStateProperty.fromMap({
          WidgetState.any: colorScheme.surfaceContainerLow,
        }),
        elevation: WidgetStateProperty.fromMap({
          WidgetState.any: 0.0,
        }),
        shape: WidgetStateProperty.fromMap({
          WidgetState.any: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius28),
          ),
        }),
        hintStyle: WidgetStateProperty.fromMap({
          WidgetState.any: AppTextStyle.bodyMedium.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        }),
        textStyle: WidgetStateProperty.fromMap({
          WidgetState.any: AppTextStyle.bodyLarge.copyWith(
            color: colorScheme.onSurface,
          ),
        }),
      ),
    );
  }
}
