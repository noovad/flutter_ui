import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/exam%20button/exam_button.dart';
import 'package:widgetbook/widgetbook.dart';

final exam = WidgetbookComponent(
  name: 'Exam ',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => Center(
        child: ExamButton(
          text: "Default Button",
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Big',
      builder: (context) => Center(
        child: ExamButton(
          text: "Big Button",
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Small',
      builder: (context) => Center(
        child: ExamButton(
          text: "Small Button",
          onPressed: () {},
        ),
      ),
    ),
  ],
);
