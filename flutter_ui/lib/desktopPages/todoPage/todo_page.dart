import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/note/note_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/summary/summary_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_tabs.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';

class TodoPage extends StatelessWidget {
  final TodoData data;
  final TodoCategories todoCategories;
  final List<String> noteCategories;
  final List<TodoCardData> todoHistory;
  final List<Note> notes;
  final List<DailyActivity> dailyActivities;
  final ValueChanged<TodoCardData> onSaveTodo;
  final ValueChanged<TodoCardData> onDeleteTodo;
  final ValueChanged<Note> onSaveNote;
  final ValueChanged<Note> onDeleteNote;
  final ValueChanged<TodoCardData> onUpdateStatus;

  const TodoPage({
    super.key,
    required this.data,
    required this.todoCategories,
    required this.noteCategories,
    required this.todoHistory,
    required this.notes,
    required this.dailyActivities,
    required this.onSaveTodo,
    required this.onDeleteTodo,
    required this.onSaveNote,
    required this.onDeleteNote,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData(),
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
                onDeleteTodo: onDeleteTodo,
                onUpdateStatus: onUpdateStatus,
              ),
            ),
          ),
          SizedBox(
            width: 800,
            child: Column(
              spacing: AppSizes.dimen16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SummarySection(dailyActivities: dailyActivities),
                Expanded(
                  child: NoteSection(notes: notes, categories: noteCategories, onSave: onSaveNote, onDelete: onDeleteNote),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
