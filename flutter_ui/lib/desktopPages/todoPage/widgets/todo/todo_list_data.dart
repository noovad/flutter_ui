import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';

class TodoListData extends StatelessWidget {
  final TabsType type;
  final List<String>? listCategory;
  final List<TodoCardData> todoCardData;
  final TaskType taskType;

  const TodoListData({
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TodoCard.createTodo(
              onSave: () => {},
              tabsType: type,
              taskType: taskType,
              listCategory: listCategory ?? [],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 166,
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: todoCardData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TodoCard.todo(
                    listCategory: listCategory ?? [],
                    taskType: TaskType.productivity,
                    data: todoCardData[index],
                    onEdit: () {},
                    onDelete: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
