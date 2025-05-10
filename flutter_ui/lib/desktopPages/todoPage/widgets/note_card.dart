import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const NoteCard({
    super.key,
    required this.note,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: AppPadding.padding12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Visibility(
                  visible: note.isPinned,
                  child: Row(
                    children: [
                      Icon(Icons.push_pin, size: 18, color: Colors.red),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    note.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                note.content,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),
            Visibility(
              visible: note.category != null,
              child: Row(
                children: [
                  const Icon(Icons.label_outline, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    note.category ?? '',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
