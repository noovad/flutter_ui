// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appNav/app_date_nav.dart';
import 'package:widgetbook/widgetbook.dart';

final navigation = WidgetbookComponent(
  name: 'App Nav',
  useCases: [
    WidgetbookUseCase(
      name: 'Date',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
            child: SizedBox(
          width: 300,
          child: AppDateNav(
            // initialDate: DateTime(2011, 4),
            onChange: (date) => debugPrint('Selected date: $date'),
          ),
        )),
      ),
    ),
  ],
);
