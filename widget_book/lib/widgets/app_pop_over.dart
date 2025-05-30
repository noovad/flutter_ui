import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appPopOver/app_pop_over.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'PopOver', type: AppPopOver, path: 'Widget')
Widget popOverUseCase(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: AppPopOver(
        padding: const EdgeInsets.all(8),
        content: Container(
          padding: const EdgeInsets.all(16),
          child: const Text('This is a dummy popover content.'),
        ),
        trigger: ElevatedButton(
          onPressed: () {},
          child: const Text('Show PopOver'),
        ),
      ),
    ),
  );
}
