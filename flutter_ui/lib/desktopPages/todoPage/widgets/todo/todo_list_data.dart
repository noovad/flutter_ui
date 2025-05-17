import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/component/app_sheet.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';

class TodoListData extends StatelessWidget {
  final TabsType tabsType;
  final List<String> listCategory;
  final List<TodoCardData> todoCardData;
  final TaskType taskType;
  final ValueChanged<TodoCardData> onSave;
  final ValueChanged<TodoCardData>? onUpdateStatus;
  final ValueChanged<TodoCardData> onDelete;
  final bool leading;

  const TodoListData({
    super.key,
    required this.tabsType,
    required this.taskType,
    required this.todoCardData,
    required this.onSave,
    required this.listCategory,
    required this.onUpdateStatus,
    required this.onDelete,
    this.leading = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget appCard({required Widget child, Color? color, double? height}) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: Card(
          elevation: 4,
          shadowColor: Colors.grey,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        ),
      );
    }

    return Expanded(
      child: Column(
        spacing: 12,
        children: [
          Padding(
            padding: AppPadding.h12,
            child: appCard(
              height: 50,
              child: InkWell(
                onTap: () => showSheet(
                  side: SheetSide.right,
                  context: context,
                  builder: (context) => TodoSheet.create(
                    taskType: taskType,
                    onSave: onSave,
                    tabsType: tabsType,
                    listCategory: listCategory,
                  ),
                ),
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
            height: MediaQuery.of(context).size.height - 172,
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
                    onDelete: onDelete,
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
