import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appUtils/app_no_data_found.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'No Data Found', type: AppNoDataFound, path: 'Widget')
Widget appUtils(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: SizedBox(
        width: 500,
        child: Center(
          child: AppNoDataFound(),
        ),
      ),
    ),
  );
}
