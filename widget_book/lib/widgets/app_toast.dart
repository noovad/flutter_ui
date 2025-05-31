import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appToast/app_simple_toast.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Toast', type: AppSimpleToast, path: 'Widget')
Widget toastUseCase(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: ElevatedButton(
        child: const Text('Show Toast'),
        onPressed: () {
          AppSimpleToast.show(
            context,
            child: const Text('This is a simple toast message.'),
            position: ToastPosition.bottomCenter,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.black87,
            verticalOffset: 25,
            horizontalOffset: 25,
          );
        },
      ),
    ),
  );
}
