import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appField/app_date_field.dart';
import 'package:widgetbook/widgetbook.dart';

final date = WidgetbookComponent(
  name: 'date field',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
          child: AppDateField(
            onChanged: (value) {
              print(value);
            },
            initialValue: DateTime.now().add(const Duration(days: 5)),
          ),
        ),
      ),
    ),
  ],
);
