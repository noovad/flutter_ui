import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';

class AppTaskCard extends StatefulWidget {
  final bool isDone;
  final String title;
  final String? category;
  final String? time;
  final String id;
  final bool leading;
  final Function(String) onDelete;
  final Function(bool) onUpdateStatus;
  final Function()? ontap;

  const AppTaskCard({
    super.key,
    required this.isDone,
    required this.title,
    required this.id,
    required this.ontap,
    required this.onDelete,
    required this.onUpdateStatus,
    required this.time,
    this.category,
    this.leading = true,
  });

  @override
  State<AppTaskCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppTaskCard> {
  bool _isHovered = false;

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
            side: BorderSide(
              color: Colors.grey,
              width: 0.25,
            ),
          ),
          dense: true,
          leading: (widget.leading)
              ? (widget.isDone == true)
                  ? IconButton(
                      onPressed: () => widget.onUpdateStatus(false),
                      icon: const Icon(Icons.check_circle_outline,
                          color: Colors.red),
                    )
                  : IconButton(
                      onPressed: () => widget.onUpdateStatus(true),
                      icon:
                          const Icon(Icons.circle_outlined, color: Colors.red),
                    )
              : null,
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: widget.isDone ? TextDecoration.lineThrough : null,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Visibility(
                    visible: widget.category != null,
                    child: Row(
                      children: [
                        Icon(Icons.label_outline,
                            size: 16, color: Colors.grey[600]),
                        AppSpaces.w4,
                        Text(widget.category ?? '',
                            style: TextStyle(color: Colors.grey[700])),
                        AppSpaces.w16,
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.time != null && widget.time != '',
                    child: Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 16, color: Colors.grey[600]),
                        AppSpaces.w4,
                        Text(
                          widget.time ?? '',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: _isHovered && (widget.isDone == false)
              ? IconButton(
                  onPressed: () => widget.onDelete(widget.id),
                  icon: const Icon(Icons.delete),
                )
              : null,
        ),
      ),
    );
  }
}
