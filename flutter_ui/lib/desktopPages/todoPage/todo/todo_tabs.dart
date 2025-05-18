import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_table.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';

class TodoTabs extends StatelessWidget {
  final TodoData todoCardData;
  final List<TodoCardData> todoHistory;
  final TodoCategories todoCategories;
  final ValueChanged<TodoCardData> onSaveTodo;
  final ValueChanged<TodoCardData> onDeleteTodo;
  final ValueChanged<TodoCardData> onUpdateStatus;

  const TodoTabs({
    super.key,
    required this.todoCardData,
    required this.todoHistory,
    required this.todoCategories,
    required this.onSaveTodo,
    required this.onDeleteTodo,
    required this.onUpdateStatus,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: TabBar(
              dividerHeight: 0,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              padding: AppPadding.all8,
              tabs: const [
                Tab(text: 'Today'),
                Tab(text: 'Upcoming'),
                Tab(text: 'History'),
                Tab(
                  icon: Icon(Icons.more_horiz),
                )
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 0,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AppSpaces.h16,
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              children: [
                TodoSection(
                  todoCardData: todoCardData,
                  tabsType: TabsType.today,
                  todoCategories: todoCategories,
                  onSave: onSaveTodo,
                  onDelete: onDeleteTodo,
                  onUpdateStatus: onUpdateStatus,
                ),
                TodoSection(
                  todoCardData: todoCardData,
                  tabsType: TabsType.upcoming,
                  todoCategories: todoCategories,
                  onSave: onSaveTodo,
                  onDelete: onDeleteTodo,
                  onUpdateStatus: onUpdateStatus,
                ),
                TablePage(
                  data: todoHistory,
                ),
                TablePage(
                  data: todoHistory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
