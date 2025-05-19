import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:flutter_ui/widgets/appSheet/app_sheet.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_sheet.dart';

class TodoCard extends StatefulWidget {
  final TabsType tabsType;
  final TaskType taskType;
  final TodoCardData data;
  final ValueChanged<TodoCardData> onSave;
  final ValueChanged<TodoCardData> onDelete;
  final List<String> listCategory;
  final ValueChanged<TodoCardData>? onUpdateStatus;
  final bool leading;

  const TodoCard({
    super.key,
    required this.tabsType,
    required this.data,
    required this.onSave,
    required this.onDelete,
    required this.taskType,
    required this.listCategory,
    required this.onUpdateStatus,
    this.leading = true,
  });

  @override
  State<TodoCard> createState() => _AppCardState();
}

class _AppCardState extends State<TodoCard> {
  bool _isHovered = false;

  void _updateStatus(bool status) {
    final todo = TodoCardData(id: widget.data.id, isDone: status);
    widget.onUpdateStatus!(todo);
  }

  void _openTodoSheet() {
    showSheet(
      context: context,
      side: SheetSide.right,
      builder: (context) => TodoSheet.update(
        tabsType: widget.tabsType,
        todoData: widget.data,
        listCategory: widget.listCategory,
        taskType: widget.taskType,
        onSave: widget.onSave,
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: _openTodoSheet,
        child: appCard(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.leading,
                  child: Checkbox(
                    value: widget.data.isDone,
                    onChanged: (value) => _updateStatus(value!),
                    shape: const CircleBorder(),
                    activeColor: Colors.red,
                  ),
                ),
                AppSpaces.w12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.data.title!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: widget.data.isDone! ? TextDecoration.lineThrough : null,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AppSpaces.w4,
                      if (widget.data.category != null || widget.data.time != null)
                        Row(
                          children: [
                            if (widget.data.category != null) ...[
                              Icon(Icons.label_outline, size: 16, color: Colors.grey[600]),
                              AppSpaces.w4,
                              Text(widget.data.category!, style: TextStyle(color: Colors.grey[700])),
                              AppSpaces.w16,
                            ],
                            if (widget.data.time != null) ...[
                              Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                              AppSpaces.w4,
                              Text(
                                widget.data.time!,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              )
                            ],
                          ],
                        ),
                    ],
                  ),
                ),
                if (_isHovered && (widget.data.isDone == false))
                  Center(
                    child: IconButton(
                      onPressed: () => widget.onDelete(widget.data),
                      icon: const Icon(Icons.delete),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
