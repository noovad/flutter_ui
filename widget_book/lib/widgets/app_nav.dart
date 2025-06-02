import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appNav/app_date_nav.dart';
import 'package:flutter_ui/widgets/appNav/app_year_nav.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Date Navigation', type: AppDateNav, path: 'Widget')
Widget dateNavigation(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: SizedBox(
        width: 300,
        child: AppDateNav(
          onChange: (date) => debugPrint('Selected date: $date'),
        ),
      ),
    ),
  );
}

@UseCase(name: 'Year Navigation', type: AppDateNav, path: 'Widget')
Widget yearNavigation(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: SizedBox(
        width: 300,
        child: AppYearNav(
          onChange: (date) => debugPrint('Selected date: $date'),
        ),
      ),
    ),
  );
}
