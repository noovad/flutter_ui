import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';

class AppTaskCard extends StatefulWidget {
  final String id;
  final bool isDone;
  final String title;
  final String? category;
  final String? time;
  final String? date;
  final bool isOverDue;
  final bool leading;
  final Function() onDelete;
  final Function() onUpdateStatus;
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
    this.isOverDue = false,
    this.date,
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
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        shadowColor: widget.isOverDue ? colorScheme.error : colorScheme.shadow,
        child: ListTile(
          onTap: widget.ontap,
          dense: true,
          leading: (widget.leading)
              ? (widget.isDone == true)
                  ? IconButton(
                      onPressed: () => widget.onUpdateStatus(),
                      icon: Icon(Icons.check_circle_outline,
                          color: colorScheme.tertiary),
                    )
                  : IconButton(
                      onPressed: () => widget.onUpdateStatus(),
                      icon: Icon(Icons.circle_outlined,
                          color: colorScheme.tertiary),
                    )
              : null,
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
              decoration: widget.isDone ? TextDecoration.lineThrough : null,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: (widget.category == '' && widget.time == '' ||
                  (widget.category == '' &&
                      widget.time == '' &&
                      widget.date == ''))
              ? null
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: widget.category != '',
                          child: Row(
                            children: [
                              Icon(Icons.label_outline,
                                  size: 16,
                                  color: colorScheme.onSurfaceVariant),
                              AppSpaces.w4,
                              Text(widget.category ?? '',
                                  style: TextStyle(
                                      color: colorScheme.onSurfaceVariant)),
                              AppSpaces.w16,
                            ],
                          ),
                        ),
                        Visibility(
                          visible: widget.time != null && widget.time != '',
                          child: Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 16,
                                  color: colorScheme.onSurfaceVariant),
                              AppSpaces.w4,
                              Text(
                                widget.time ?? '',
                                style: TextStyle(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              AppSpaces.w16,
                            ],
                          ),
                        ),
                        Visibility(
                          visible: widget.date != null && widget.date != '',
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_outlined,
                                  size: 16,
                                  color: colorScheme.onSurfaceVariant),
                              AppSpaces.w4,
                              Text(
                                widget.date ?? '',
                                style: TextStyle(
                                  color: colorScheme.onSurfaceVariant,
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
                  onPressed: () => widget.onDelete(),
                  icon:
                      Icon(Icons.delete_outline, color: colorScheme.secondary),
                )
              : null,
        ),
      ),
    );
  }
}
