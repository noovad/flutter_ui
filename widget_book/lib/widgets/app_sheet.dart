import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appButton/app_button.dart';
import 'package:flutter_ui/widgets/appSheet/app_sheet.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Sheet', type: SheetSide, path: 'Widget')
Widget appButton(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: AppButton.icon(
        onPressed: () => appSheet(
          context: context,
          builder: (context) => Container(
            padding: EdgeInsets.all(24),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Dummy AppSheet', style: TextStyle(fontSize: 20)),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        icon: Icons.menu,
      ),
    ),
  );
}
