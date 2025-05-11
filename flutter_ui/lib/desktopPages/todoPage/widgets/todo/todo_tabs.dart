import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_table.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoTabs extends StatelessWidget {
  final TodoData todoCardData;
  final List<TodoCardData> todoHistory;
  final TodoCategories todoCategories;

  const TodoTabs({
    super.key,
    required this.todoCardData,
    required this.todoHistory,
    required this.todoCategories,
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
            todoCategories: todoCategories,
            onSave: () {},
          ),
          child: const Text('Today'),
        ),
        ShadTab(
          value: 'Upcoming',
          content: TodoSection(
            todoCardData: todoCardData,
            tabsType: TabsType.upcoming,
            todoCategories: todoCategories,
            onSave: () {},
          ),
          child: const Text('Upcoming'),
        ),
        ShadTab(
          value: 'Auto',
          content: TodoSection(
            todoCardData: todoCardData,
            tabsType: TabsType.auto,
            todoCategories: todoCategories,
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
