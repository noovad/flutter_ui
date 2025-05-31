import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      initialRoute: '/?path=color-scheme/themedata/color',
      themeMode: ThemeMode.light,
      lightTheme: AppTheme.lightTheme(),
      directories: directories,
    );
  }
}
