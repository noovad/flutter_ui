import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appField/app_date_field.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';
import 'package:flutter_ui/widgets/appField/app_time_field.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

enum InputType { text, date, time }

@UseCase(name: 'Input', type: AppTextField, path: 'Widget')
Widget textFieldUseCase(BuildContext context) {
  final inputType = context.knobs.list<InputType>(
    label: 'Input Type',
    options: InputType.values,
    initialOption: InputType.text,
  );

  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: SizedBox(
        width: 300,
        child: _buildSelectedInput(inputType, context),
      ),
    ),
  );
}

Widget _buildSelectedInput(InputType type, BuildContext context) {
  switch (type) {
    case InputType.text:
      return AppTextField(
        label: "Text Field",
        hint: "Enter text",
        initialValue: "Initial text",
        errorText:
            context.knobs.boolean(label: 'Show Error', initialValue: false)
                ? "This is an error"
                : null,
        readOnly:
            context.knobs.boolean(label: 'Read Only', initialValue: false),
        enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      );

    case InputType.date:
      return AppDateField(onChanged: (value) {}, initialValue: DateTime.now());

    case InputType.time:
      return AppTimeField(
        onChanged: (value) {},
        label: "Time",
        hintHour: "HH",
        hintMinute: "MM",
        initialValue:
            context.knobs.string(label: 'Time Value', initialValue: "12:30"),
        errorText:
            context.knobs.boolean(label: 'Show Error', initialValue: false)
                ? "Invalid time format"
                : null,
      );
  }
}
