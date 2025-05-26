// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appField/app_date_field.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';
import 'package:flutter_ui/widgets/appField/app_time_field.dart';
import 'package:widgetbook/widgetbook.dart';

final date = WidgetbookComponent(
  name: 'App Field',
  useCases: [
    WidgetbookUseCase(
      name: 'Text',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
          child: SizedBox(
            width: 300,
            child: AppTextField(
              onChanged: (value) {
                print(value);
              },
              label: "Text Field",
              hint: "Enter text",
              initialValue: "Initial text",
              errorText: "This is an error",
              readOnly: false,
              enabled: true,
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Date',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
          child: SizedBox(
            width: 300,
            child: AppDateField(
              onChanged: (value) {
                print(value);
              },
              initialValue: DateTime.now().add(const Duration(days: 5)),
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Time',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
          child: SizedBox(
            width: 300,
            child: AppTimeField(
              onChanged: (value) {
                print(value);
              },
              label: "Time",
              hintHour: "HH",
              hintMinute: "MM",
              initialValue: "12:30",
              errorText: "Invalid time format",
            ),
          ),
        ),
      ),
    ),
  ],
);
