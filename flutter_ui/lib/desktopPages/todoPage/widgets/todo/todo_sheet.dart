import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_form.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TodoSheetType { create }

enum TaskType { daily, productivity }

class TodoSheet extends StatelessWidget {
  final TodoSheetType? type;
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

  const TodoSheet({
    super.key,
    required this.side,
    required this.todoData,
    required this.taskType,
    required this.listCategory,
    this.onSave,
  })  : type = null,
        tabsType = null;

  @override
  Widget build(BuildContext context) {
    final isCreate = type == TodoSheetType.create;

    return ShadSheet(
      constraints: BoxConstraints(
        minWidth: 520,
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      title: taskType == TaskType.daily
          ? Text(isCreate ? 'Create Todo Daily' : 'Detail Todo Daily')
          : Text(isCreate
              ? 'Create Todo Productivity'
              : 'Detail Todo Productivity'),
      actions: isCreate
          ? [
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
            ]
          : [
              Visibility(
                visible: !(todoData?.isDone ?? false),
                child: ShadButton(
                  size: ShadButtonSize.sm,
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Visibility(
                visible: !(todoData?.isDone ?? false),
                child: ShadButton(
                  child: const Text('Update'),
                  onPressed: () {
                    if (onSave != null) onSave!();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
      child: TodoForm(
        tabsType: tabsType,
        listCategory: listCategory,
        taskType: taskType,
        isDone: isCreate ? false : todoData!.isDone,
        initialTitle: isCreate ? '' : todoData!.title,
        initialCategory: isCreate ? 'None' : (todoData!.category ?? 'None'),
        initialNotes: isCreate ? '' : (todoData!.note ?? ''),
        initialDate: isCreate
            ? (tabsType == TabsType.upcoming
                ? DateTime.now().add(const Duration(days: 1))
                : DateTime.now())
            : todoData!.date,
        initialTime: isCreate ? null : todoData!.time,
      ),
    );
  }
}
