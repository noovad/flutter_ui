import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_table.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoTabs extends StatelessWidget {
  final TodoData todoCardData;
  final List<TodoCardData> todoHistory;
  final TodoCategories todoCategories;
  final ValueChanged<TodoCardData> onSaveTodo;
  final ValueChanged<TodoCardData> onUpdateStatus;

  const TodoTabs({
    super.key,
    required this.todoCardData,
    required this.todoHistory,
    required this.todoCategories,
    required this.onSaveTodo,
    required this.onUpdateStatus,
  });
  @override
  Widget build(BuildContext context) {
    return ShadTabs<String>(
      value: 'Today',
      padding: AppPadding.all4,
      gap: AppSizes.dimen16,
      tabs: [
        ShadTab(
          value: 'Today',
          content: TodoSection(
            todoCardData: todoCardData,
            tabsType: TabsType.today,
            todoCategories: todoCategories,
            onSave: onSaveTodo,
            onUpdateStatus: onUpdateStatus,
          ),
          child: const Text('Today'),
        ),
        ShadTab(
          value: 'Upcoming',
          content: TodoSection(
            todoCardData: todoCardData,
            tabsType: TabsType.upcoming,
            todoCategories: todoCategories,
            onSave: onSaveTodo,
            onUpdateStatus: onUpdateStatus,
          ),
          child: const Text('Upcoming'),
        ),
        ShadTab(
          value: 'Auto',
          content: TodoSection(
            todoCardData: todoCardData,
            tabsType: TabsType.auto,
            todoCategories: todoCategories,
            onSave: onSaveTodo,
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
