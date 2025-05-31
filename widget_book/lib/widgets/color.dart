import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/color_scheme_showcase.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Color', type: ThemeData, path: 'Color Scheme')
Widget colorScheme(BuildContext context) {
  return MaterialApp(
    title: 'Black & White UI',
    theme: ThemeData(
      colorScheme: AppTheme.lightColorScheme(),
      useMaterial3: true,
    ),
    home: const ColorSchemeShowcase(),
  );
}
