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
        dailyActivities: dailyActivities,
        noteCategories: noteCategories,
        todoCategories: todoCategories,
        data: todoData,
        todoHistory: todoHistory,
        notes: sampleNotes,
        onSaveTodo: (todo) {
          debugPrint(
            '🏠 Parent got todo → '
            'id: ${todo.id}, '
            'title: ${todo.title}, '
            'date: ${todo.date}, '
            'time: ${todo.time}, '
            'note: ${todo.note}, '
            'category: ${todo.category}',
          );
        },
        onSaveNote: (note) {
          debugPrint(
            '🏠 Parent got note → '
            'id: ${note.id}, '
            'title: ${note.title}, '
            'content: ${note.content}, '
            'category: ${note.category}',
          );
        },
        onUpdateStatus: (status) {
          debugPrint('🏠 Parent got status → ${status.id}');
        },
      ),
    );
  }
}
