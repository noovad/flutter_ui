import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_content.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_sheet.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum AppCardType { todo, createTodo }

class TodoCard extends StatefulWidget {
  final AppCardType type;
  final TabsType? tabsType;
  final TaskType? taskType;
  final TodoCardData? data;
  final List<String> listCategory;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onSave;

  const TodoCard.todo({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onDelete,
    required this.taskType,
    required this.listCategory,
  })  : type = AppCardType.todo,
        onSave = null,
        tabsType = null;

  const TodoCard.createTodo({
    super.key,
    required this.onSave,
    required this.tabsType,
    required this.taskType,
    required this.listCategory,
  })  : type = AppCardType.createTodo,
        data = null,
        onEdit = null,
        onDelete = null;

  @override
  State<TodoCard> createState() => _AppCardState();
}

class _AppCardState extends State<TodoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case AppCardType.todo:
        return _buildTodoCard(widget.data!);
      case AppCardType.createTodo:
        return _buildCreateTodo(widget.taskType!);
    }
  }

  Widget _buildTodoCard(TodoCardData data) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: _card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: data.isDone,
                onChanged: (_) {},
                shape: const CircleBorder(),
                activeColor: Colors.red,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () => showShadSheet(
                    side: ShadSheetSide.right,
                    context: context,
                    builder: (context) => TodoSheet.update(
                      side: ShadSheetSide.right,
                      todoData: data,
                      listCategory: widget.listCategory,
                      taskType: widget.taskType,
                    ),
                  ),
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration:
                              data.isDone ? TextDecoration.lineThrough : null,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      if (data.category != null || data.time != null)
                        Row(
                          children: [
                            if (data.category != null &&
                                data.category != null) ...[
                              Icon(LucideIcons.tag,
                                  size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(data.category!,
                                  style: TextStyle(color: Colors.grey[700])),
                              const SizedBox(width: 16),
                            ],
                            if (data.time != null) ...[
                              Icon(Icons.access_time,
                                  size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(
                                data.time != null
                                    ? '${data.time!.hour.toString().padLeft(2, '0')}:${data.time!.minute.toString().padLeft(2, '0')}'
                                    : '',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              if (_isHovered)
                Center(
                  child: ShadIconButton.ghost(
                    icon: const Icon(LucideIcons.trash),
                    onPressed: widget.onDelete,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreateTodo(TaskType taskType) {
    return _card(
      height: 50,
      color: Color(0xFF27272A),
      child: InkWell(
        onTap: () => showShadSheet(
          side: ShadSheetSide.right,
          context: context,
          builder: (context) => TodoSheet.create(
            taskType: taskType,
            side: ShadSheetSide.right,
            onSave: widget.onSave,
            tabsType: widget.tabsType!,
            listCategory: widget.listCategory,
          ),
        ),
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.add,
            size: 24,
          ),
        ),
      ),
    );
  }
}

Widget _card({required Widget child, Color? color, double? height}) {
  return SizedBox(
    height: height ?? 80,
    width: double.infinity,
    child: Card(
      elevation: 4,
      shadowColor: Colors.grey,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: child,
    ),
  );
}
