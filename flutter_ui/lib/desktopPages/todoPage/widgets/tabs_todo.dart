import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/card_todo.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoTabs extends StatelessWidget {
  final List<TodoCardData> todoCardData;

  const TodoTabs({
    super.key,
    required this.todoCardData,
  });
  @override
  Widget build(BuildContext context) {
    return ShadTabs<String>(
      value: 'account',
      padding: const EdgeInsets.all(4),
      gap: 16,
      tabs: [
        ShadTab(
          value: 'account',
          content: ContentTabs(todoCardData: todoCardData),
          child: const Text('Today'),
        ),
        ShadTab(
          value: 'password',
          content: Column(
            children: todoCardData.map((data) {
              return TodoCard(
                isDone: data.isDone,
                title: data.title,
                time: data.time,
                category: data.category,
                categoryIcon: data.categoryIcon,
                onEdit: () {},
                onDelete: () {},
              );
            }).toList(),
          ),
          child: const Text('Upcoming'),
        ),
        ShadTab(
          value: 'Third',
          content: Column(
            children: todoCardData.map((data) {
              return TodoCard(
                isDone: data.isDone,
                title: data.title,
                time: data.time,
                category: data.category,
                categoryIcon: data.categoryIcon,
                onEdit: () {},
                onDelete: () {},
              );
            }).toList(),
          ),
          child: const Text('History'),
        ),
      ],
    );
  }
}

class ContentTabs extends StatelessWidget {
  const ContentTabs({
    super.key,
    required this.todoCardData,
  });

  final List<TodoCardData> todoCardData;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32,
      children: [
        Expanded(
          child: Column(
            spacing: 12,
            children: todoCardData
                .sublist(0, (todoCardData.length / 2).ceil())
                .map((data) {
              return TodoCard(
                isDone: data.isDone,
                title: data.title,
                time: data.time,
                category: data.category,
                categoryIcon: data.categoryIcon,
                onEdit: () {},
                onDelete: () {},
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: Column(
            spacing: 12,
            children: todoCardData
                .sublist((todoCardData.length / 2).ceil())
                .map((data) {
              return TodoCard(
                isDone: data.isDone,
                title: data.title,
                time: data.time,
                category: data.category,
                categoryIcon: data.categoryIcon,
                onEdit: () {},
                onDelete: () {},
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
