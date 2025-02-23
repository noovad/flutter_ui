import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/exam%20button/exam_button.dart';
import 'package:widgetbook/widgetbook.dart';

final exam1 = WidgetbookComponent(
  name: 'Exam 1',
  useCases: [
    WidgetbookUseCase(
      name: 'Exam',
      builder: (context) => Center(
        child: ExamButton(
          text: "Click Me",
          onPressed: () {},
        ),
      ),
    ),
  ],
);
