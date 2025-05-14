import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/summary/summary_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_tabs.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoPage extends StatelessWidget {
  final TodoData data;
  final TodoCategories todoCategories;
  final List<String> noteCategories;
  final List<TodoCardData> todoHistory;
  final List<Note> notes;
  final List<DailyActivity> dailyActivities;
  final ValueChanged<TodoCardData> onSaveTodo;
  final ValueChanged<Note> onSaveNote;

  const TodoPage({
    super.key,
    required this.data,
    required this.todoCategories,
    required this.noteCategories,
    required this.todoHistory,
    required this.notes,
    required this.dailyActivities,
    required this.onSaveTodo,
    required this.onSaveNote,
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
            child: Padding(
              padding: AppPadding.all16,
              child: TodoTabs(
                todoCardData: data,
                todoCategories: todoCategories,
                todoHistory: todoHistory,
                onSaveTodo: onSaveTodo,
              ),
            ),
          ),
          SizedBox(
            width: 700,
            child: Column(
              spacing: AppSizes.dimen16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SummarySection(dailyActivities: dailyActivities),
                Expanded(
                  child: NoteSection(
                    notes: notes,
                    categories: noteCategories,
                    onSave: onSaveNote,
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
