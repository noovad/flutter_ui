import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_list_data.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';

enum TabsType { today, upcoming, history, auto }

class TodoSection extends StatelessWidget {
  final TabsType tabsType;
  final TodoData todoCardData;
  final TodoCategories todoCategories;
  final ValueChanged<TodoCardData> onSave;
  final bool leading;
  final ValueChanged<TodoCardData>? onUpdateStatus;


  const TodoSection({
    super.key,
    required this.tabsType,
    required this.todoCardData,
    required this.todoCategories,
    required this.onSave,
    this.onUpdateStatus,
    this.leading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TodoListData(
          tabsType: tabsType,
          listCategory: todoCategories.productivity,
          todoCardData: todoCardData.productivity,
          taskType: TaskType.productivity,
          onSave: onSave,
          leading: leading,
          onUpdateStatus: onUpdateStatus,
        ),
        TodoListData(
          tabsType: tabsType,
          listCategory: todoCategories.daily,
          todoCardData: todoCardData.daily,
          taskType: TaskType.daily,
          onSave: onSave,
          leading: leading,
          onUpdateStatus: onUpdateStatus,
        ),
      ],
    );
  }
}
