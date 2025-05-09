import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/pop_over.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String? category;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.title,
    this.category,
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (category != null)
                      Text(category!,
                          style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
              Popover(
                content: Column(
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
                child: Icon(Icons.more_vert, color: Colors.grey[700]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
