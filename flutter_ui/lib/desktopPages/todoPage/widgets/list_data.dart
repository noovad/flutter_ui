import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_content.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_sheet.dart';

class ListData extends StatelessWidget {
  final TabsType type;
  final List<String>? listCategory;
  final List<TodoCardData> todoCardData;
  final TaskType taskType;

  const ListData({
    super.key,
    required this.type,
    required this.taskType,
    required this.todoCardData,
    this.listCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 12,
        children: [
          TodoCard.createTodo(
            onSave: () => {},
            tabsType: type,
            taskType: taskType,
            listCategory: listCategory ?? [],
          ),
          SingleChildScrollView(
            child: ListView.builder(
              itemCount: todoCardData.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TodoCard.todo(
                  listCategory: listCategory ?? [],
                  taskType: TaskType.productivity,
                  data: todoCardData[index],
                  onEdit: () {},
                  onDelete: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
