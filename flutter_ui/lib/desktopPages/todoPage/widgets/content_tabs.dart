import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/card_todo.dart';

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
                data: data,
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
                data: data,
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
