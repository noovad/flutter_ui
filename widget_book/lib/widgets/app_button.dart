import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appButton/app_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Icon', type: AppButton, path: 'Widget')
Widget appButton(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: SizedBox(
        width: 500,
        child: Center(
          child: AppButton.icon(onPressed: () {}, icon: Icons.add),
        ),
      ),
    ),
  );
}
