import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note_content.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_tabs.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoPage extends StatelessWidget {
  final TodoData data;
  final List<String> listCategory;
  final List<TodoCardData> todoHistory;
  final List<Note> notes;

  const TodoPage({
    super.key,
    required this.data,
    required this.listCategory,
    required this.todoHistory,
    required this.notes,
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
                  listCategory: listCategory,
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
                  child: NoteContent(
                    notes: notes,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Align(child: Text('Three')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
