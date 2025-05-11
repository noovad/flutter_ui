import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_list_data.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';

enum TabsType { today, upcoming, history, auto }

class TodoSection extends StatelessWidget {
  final TabsType type;
  final TodoData todoCardData;
  final List<String> listCategory;

  const TodoSection({
    super.key,
    required this.type,
    required this.todoCardData,
    required this.listCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TodoListData(
          type: type,
          listCategory: listCategory,
          todoCardData: todoCardData.productivity,
          taskType: TaskType.productivity,
        ),
        TodoListData(
          type: type,
          todoCardData: todoCardData.daily,
          taskType: TaskType.daily,
        ),
      ],
    );
  }
}
