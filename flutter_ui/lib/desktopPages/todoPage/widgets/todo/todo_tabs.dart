import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_table.dart';
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
          content: TodoSection(
            todoCardData: todoCardData,
            tabsType: TabsType.today,
            listCategory: listCategory,
            onSave: () {},
          ),
          child: const Text('Today'),
        ),
        ShadTab(
          value: 'Upcoming',
          content: TodoSection(
            todoCardData: todoCardData,
            tabsType: TabsType.upcoming,
            listCategory: listCategory,
            onSave: () {},
          ),
          child: const Text('Upcoming'),
        ),
        ShadTab(
          value: 'Auto',
          content: TodoSection(
            todoCardData: todoCardData,
            tabsType: TabsType.auto,
            listCategory: listCategory,
            onSave: () {},
            leading: false,
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
