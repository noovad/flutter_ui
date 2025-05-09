import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/pop_over.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final String? time;
  final String? category;
  final IconData? categoryIcon;
  final bool isDone;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TodoCard({
    super.key,
    required this.title,
    this.time,
    this.category,
    this.categoryIcon,
    this.isDone = false,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: isDone,
                onChanged: (_) {},
                shape: const CircleBorder(),
                activeColor: Colors.red.shade700,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (category != null || time != null)
                      Row(
                        children: [
                          if (category != null && categoryIcon != null) ...[
                            Icon(categoryIcon,
                                size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(category!,
                                style: TextStyle(color: Colors.grey[700])),
                            const SizedBox(width: 16),
                          ],
                          if (time != null) ...[
                            Icon(Icons.access_time,
                                size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(time!,
                                style: TextStyle(color: Colors.grey[700])),
                          ],
                        ],
                      ),
                  ],
                ),
              ),
              Popover(
                content: Card(
                  elevation: 4,
                  shadowColor: Colors.grey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: onEdit,
                        icon: const Icon(Icons.edit, size: 16),
                        label: const Text("Edit"),
                      ),
                      TextButton.icon(
                        onPressed: onDelete,
                        icon: const Icon(Icons.delete, size: 16),
                        label: const Text("Delete"),
                      ),
                    ],
                  ),
                ),
                child: Icon(Icons.more_vert, color: Colors.grey[700]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
