import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';

class TodoCard extends StatefulWidget {
  final TodoCardData data;
  final ValueChanged<TodoCardData> onDelete;
  final ValueChanged<TodoCardData>? onUpdateStatus;
  final bool leading;
  final Function()? ontap;

  const TodoCard({
    super.key,
    required this.data,
    required this.onDelete,
    required this.onUpdateStatus,
    this.ontap,
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
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey,
        child: ListTile(
          onTap: widget.ontap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          hoverColor: Colors.blue,
          splashColor: Colors.red,
          dense: true,
          leading: (widget.leading)
              ? (widget.data.isDone == true)
                  ? IconButton(
                      onPressed: () => _updateStatus(false),
                      icon: const Icon(Icons.check_circle_outline, color: Colors.red),
                    )
                  : IconButton(
                      onPressed: () => _updateStatus(true),
                      icon: const Icon(Icons.circle_outlined, color: Colors.red),
                    )
              : null,
          title: Text(
            widget.data.title!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: widget.data.isDone! ? TextDecoration.lineThrough : null,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: widget.data.category != null,
                child: Row(
                  children: [
                    Icon(Icons.label_outline, size: 16, color: Colors.grey[600]),
                    AppSpaces.w4,
                    Text(widget.data.category ?? '', style: TextStyle(color: Colors.grey[700])),
                    AppSpaces.w16,
                  ],
                ),
              ),
              Visibility(
                visible: widget.data.time != null,
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    AppSpaces.w4,
                    Text(
                      widget.data.time ?? '',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          trailing: _isHovered && (widget.data.isDone == false)
              ? IconButton(
                  onPressed: () => widget.onDelete(widget.data),
                  icon: const Icon(Icons.delete),
                )
              : null,
        ),
      ),
    );
  }
}
