import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appDialog/app_dialog.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Dialog', type: AppDialog, path: 'Widget')
Widget appDialogGeneral(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: SizedBox(
        width: 500,
        child: Center(
          child: AppDialog(
            trigger:
                Text('Show', style: Theme.of(context).textTheme.headlineSmall),
            content: Padding(
              padding: AppPadding.all16,
              child: Text(
                'This is a dialog content. You can put any widget here, such as forms, text, or images.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
