import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoListData extends StatelessWidget {
  final TabsType tabsType;
  final List<String> listCategory;
  final List<TodoCardData> todoCardData;
  final TaskType taskType;
  final ValueChanged<TodoCardData> onSave;
  final ValueChanged<TodoCardData>? onUpdateStatus;
  final bool leading;

  const TodoListData({
    super.key,
    required this.tabsType,
    required this.taskType,
    required this.todoCardData,
    required this.onSave,
    required this.listCategory,
    required this.onUpdateStatus,
    this.leading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 12,
        children: [
          Padding(
            padding: AppPadding.h12,
            child: AppCard(
              height: 50,
              color: Color(0xFF27272A),
              child: InkWell(
                onTap: () => showShadSheet(
                  side: ShadSheetSide.right,
                  context: context,
                  builder: (context) => TodoSheet.create(
                    taskType: taskType,
                    side: ShadSheetSide.right,
                    onSave: onSave,
                    tabsType: tabsType,
                    listCategory: listCategory,
                  ),
                ),
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: const Padding(
                  padding: AppPadding.h8,
                  child: Icon(
                    Icons.add,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 166,
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              padding: AppPadding.h12,
              itemCount: todoCardData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TodoCard(
                    tabsType: tabsType,
                    listCategory: listCategory,
                    taskType: TaskType.productivity,
                    data: todoCardData[index],
                    onSave: onSave,
                    onUpdateStatus: onUpdateStatus,
                    onDelete: () {},
                    leading: leading,
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
