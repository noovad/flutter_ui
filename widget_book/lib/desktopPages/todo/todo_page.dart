import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo_page.dart';
import 'package:widget_book/desktopPages/todo/data.dart';
import 'package:widgetbook/widgetbook.dart';

final todo = WidgetbookUseCase(
  name: 'Todo Page',
  builder: (context) => Center(
    child: MyWidget(),
  ),
);

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF222222),
      child: TodoPage(
        noteCategories: noteCategories,
        todoCategories: todoCategories,
        data: todoData,
        todoHistory: todoHistory,
        notes: sampleNotes,
      ),
    );
  }
}
