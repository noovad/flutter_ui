import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/sheet_todo.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoCard extends StatefulWidget {
  final TodoCardData data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TodoCard({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: SizedBox(
        height: 80,
        child: Card(
          elevation: 4,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: widget.data.isDone,
                  onChanged: (_) {},
                  shape: const CircleBorder(),
                  activeColor: Colors.red.shade700,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: () => showShadSheet(
                      side: ShadSheetSide.right,
                      context: context,
                      builder: (context) => TodoSheet(
                        side: ShadSheetSide.right,
                        todoData: widget.data,
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
                          widget.data.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: widget.data.isDone
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        if (widget.data.category != null ||
                            widget.data.time != null)
                          Row(
                            children: [
                              if (widget.data.category != null &&
                                  widget.data.categoryIcon != null) ...[
                                Icon(widget.data.categoryIcon,
                                    size: 16, color: Colors.grey[600]),
                                const SizedBox(width: 4),
                                Text(widget.data.category!,
                                    style: TextStyle(color: Colors.grey[700])),
                                const SizedBox(width: 16),
                              ],
                              // if (widget.data.time != null) ...[
                              //   Icon(Icons.access_time,
                              //       size: 16, color: Colors.grey[600]),
                              //   const SizedBox(width: 4),
                              //   Text(widget.data.time!,
                              //       style: TextStyle(color: Colors.grey[700])),
                              // ],
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
      ),
    );
  }
}
