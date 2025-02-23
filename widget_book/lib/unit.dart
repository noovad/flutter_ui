import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent newStory({
  required String name,
  required String description,
  required Widget child,
}) {
  return WidgetbookComponent(
    name: name,
    useCases: [
      WidgetbookUseCase(
        name: 'Default',
        builder: (context) {
          return Center(
            child: child,
          );
        },
      ),
    ],
  );
}
