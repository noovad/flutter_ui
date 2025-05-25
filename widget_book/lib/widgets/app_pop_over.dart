// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appPopOver/app_pop_over.dart';
import 'package:widgetbook/widgetbook.dart';

final popOver = WidgetbookComponent(
  name: 'App Pop Over',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
          child: AppPopOver(
            padding: EdgeInsets.all(8),
            content: Container(
              padding: EdgeInsets.all(16),
              child: Text('This is a dummy popover content.'),
            ),
            trigger: ElevatedButton(
              onPressed: () {},
              child: Text('Show PopOver'),
            ),
          ),
        ),
      ),
    ),
  ],
);
