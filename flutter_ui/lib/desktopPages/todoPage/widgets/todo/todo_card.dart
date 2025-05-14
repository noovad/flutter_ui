import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoCard extends StatefulWidget {
  final TabsType tabsType;
  final TaskType taskType;
  final TodoCardData data;
  final ValueChanged<TodoCardData> onSave;
  final VoidCallback onDelete;
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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AppCard(
        color: Colors.black,
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
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () => showShadSheet(
                    side: ShadSheetSide.right,
                    context: context,
                    builder: (context) => TodoSheet.update(
                      tabsType: widget.tabsType,
                      side: ShadSheetSide.right,
                      todoData: widget.data,
                      listCategory: widget.listCategory,
                      taskType: widget.taskType,
                      onSave: widget.onSave,
                    ),
                  ),
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
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
                      const SizedBox(height: 4),
                      if (widget.data.category != null || widget.data.time != null)
                        Row(
                          children: [
                            if (widget.data.category != null) ...[
                              Icon(LucideIcons.tag, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(widget.data.category!, style: TextStyle(color: Colors.grey[700])),
                              const SizedBox(width: 16),
                            ],
                            if (widget.data.time != null) ...[
                              Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
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
              ),
              if (_isHovered && (widget.data.isDone == false))
                Center(
                  child: ShadIconButton.ghost(
                    icon: const Icon(LucideIcons.trash),
                    onPressed: widget.onDelete,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
