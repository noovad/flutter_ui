import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_form.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TodoSheetType { create, detail }

enum TaskType { daily, productivity }

class TodoSheet extends StatelessWidget {
  final TodoSheetType type;
  final TabsType? tabsType;
  final TaskType? taskType;
  final ShadSheetSide side;
  final TodoCardData? todoData;
  final VoidCallback? onSave;
  final List<String> listCategory;

  const TodoSheet.create({
    super.key,
    required this.side,
    required this.onSave,
    required this.tabsType,
    required this.taskType,
    required this.listCategory,
  })  : type = TodoSheetType.create,
        todoData = null;

  const TodoSheet.detail({
    super.key,
    required this.side,
    required this.todoData,
    required this.taskType,
    required this.listCategory,
    this.onSave,
  })  : type = TodoSheetType.detail,
        tabsType = null;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    switch (type) {
      case TodoSheetType.create:
        return _createSheet(context, theme);
      case TodoSheetType.detail:
        return _detailSheet(context, theme);
    }
  }

  ShadSheet _createSheet(BuildContext context, ShadThemeData theme) {
    return ShadSheet(
      constraints: BoxConstraints(
        minWidth: 520,
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      title: taskType == TaskType.daily
          ? Text('Create Todo Daily')
          : Text('Create Todo Productivity'),
      actions: [
        ShadButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ShadButton(
          child: const Text('Create'),
          onPressed: () {
            if (onSave != null) onSave!();
            Navigator.of(context).pop();
          },
        ),
      ],
      child: TodoForm(
        listCategory: listCategory,
        taskType: taskType,
        isDone: false,
        initialTitle: '',
        initialCategory: 'None',
        initialNotes: '',
        initialDate: tabsType == TabsType.upcoming
            ? DateTime.now().add(const Duration(days: 1))
            : DateTime.now(),
        initialTime: null,
      ),
    );
  }

  ShadSheet _detailSheet(BuildContext context, ShadThemeData theme) {
    return ShadSheet(
      constraints: BoxConstraints(
        minWidth: 520,
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      title: taskType == TaskType.daily
          ? Text('Detail Todo Daily')
          : Text('Detail Todo Productivity'),
      actions: [
        Visibility(
          visible: !(todoData?.isDone ?? false),
          child: ShadButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Visibility(
          visible: !(todoData?.isDone ?? false),
          child: ShadButton(
            child: const Text('Detail'),
            onPressed: () {
              if (onSave != null) onSave!();
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
      child: TodoForm(
        listCategory: listCategory,
        taskType: taskType,
        isDone: todoData!.isDone,
        initialTitle: todoData!.title,
        initialCategory: todoData!.category ?? 'None',
        initialNotes: todoData!.note ?? '',
        initialDate: todoData!.date,
        initialTime: todoData!.time,
      ),
    );
  }
}
