// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appToast/app_simple_toast.dart';
import 'package:widgetbook/widgetbook.dart';

final toast = WidgetbookComponent(
  name: 'App Toast',
  useCases: [
    WidgetbookUseCase(
      name: 'Simple',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
            child: ElevatedButton(
          child: Text('Show Toast'),
          onPressed: () {
            AppSimpleToast.show(
              context,
              child: Text('This is a simple toast message.'),
              position: ToastPosition.bottomCenter,
              duration: Duration(seconds: 3),
              backgroundColor: Colors.black87,
              verticalOffset: 25,
              horizontalOffset: 25,
            );
          },
        )),
      ),
    ),
  ],
);
