import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/list_data.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_sheet.dart';

enum TabsType { today, upcoming, history, auto }

class TodoContent extends StatelessWidget {
  final TabsType type;
  final TodoData todoCardData;
  final List<String> listCategory;

  const TodoContent({
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
        ListData(
          type: type,
          listCategory: listCategory,
          todoCardData: todoCardData.productivity,
          taskType: TaskType.productivity,
        ),
        ListData(
          type: type,
          todoCardData: todoCardData.daily,
          taskType: TaskType.daily,
        ),
      ],
    );
  }
}
