import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/summary/summary_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_tabs.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoPage extends StatelessWidget {
  final TodoData data;
  final TodoCategories todoCategories;
  final List<String> noteCategories;
  final List<TodoCardData> todoHistory;
  final List<Note> notes;
  final List<DailyActivity> dailyActivities;

  const TodoPage({
    super.key,
    required this.data,
    required this.todoCategories,
    required this.noteCategories,
    required this.todoHistory,
    required this.notes,
    required this.dailyActivities,
  });

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      theme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadZincColorScheme.dark(),
      ),
      home: Row(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(16),
                child: TodoTabs(
                  todoCardData: data,
                  todoCategories: todoCategories,
                  todoHistory: todoHistory,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: NoteSection(
                    notes: notes,
                    categories: noteCategories,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SummarySection(
                    dailyActivities: dailyActivities
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
