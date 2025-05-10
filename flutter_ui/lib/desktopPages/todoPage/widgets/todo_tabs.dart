import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_content.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_table.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoTabs extends StatelessWidget {
  final TodoData todoCardData;
  final List<TodoCardData> todoHistory;
  final List<String> listCategory;

  const TodoTabs({
    super.key,
    required this.todoCardData,
    required this.todoHistory,
    required this.listCategory,
  });
  @override
  Widget build(BuildContext context) {
    return ShadTabs<String>(
      value: 'Today',
      padding: const EdgeInsets.all(4),
      gap: 16,
      tabs: [
        ShadTab(
          value: 'Today',
          content: TodoContent(
            todoCardData: todoCardData,
            type: TabsType.today,
            listCategory: listCategory,
          ),
          child: const Text('Today'),
        ),
        ShadTab(
          value: 'Upcoming',
          content: TodoContent(
            todoCardData: todoCardData,
            type: TabsType.upcoming,
            listCategory: listCategory,
          ),
          child: const Text('Upcoming'),
        ),
        ShadTab(
          value: 'Auto',
          content: TodoContent(
            todoCardData: todoCardData,
            type: TabsType.auto,
            listCategory: listCategory,
          ),
          child: const Text('Auto'),
        ),
        ShadTab(
          value: 'History',
          content: TablePage(
            data: todoHistory,
          ),
          child: const Text('History'),
        ),
      ],
    );
  }
}
