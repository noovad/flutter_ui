import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_list_data.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';

enum TabsType { today, upcoming, history, auto }

class TodoSection extends StatelessWidget {
  final TabsType tabsType;
  final TodoData todoCardData;
  final List<String> listCategory;
  final VoidCallback? onSave;
  final bool leading;

  const TodoSection({
    super.key,
    required this.tabsType,
    required this.todoCardData,
    required this.listCategory,
    required this.onSave,
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
          listCategory: listCategory,
          todoCardData: todoCardData.productivity,
          taskType: TaskType.productivity,
          onSave: onSave,
          leading: leading,
        ),
        TodoListData(
          tabsType: tabsType,
          listCategory: listCategory,
          todoCardData: todoCardData.daily,
          taskType: TaskType.daily,
          onSave: onSave,
          leading: leading,
        ),
      ],
    );
  }
}
