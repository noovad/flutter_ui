import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';

class NoteCard extends StatefulWidget {
  final String noteId;
  final String noteTitle;
  final String noteContent;
  final String? noteCategory;
  final bool isPinned;
  final ValueChanged<String> onUpdate;
  final ValueChanged<String> onDelete;
  final Function()? onTap;

  const NoteCard({
    super.key,
    required this.noteId,
    required this.noteTitle,
    required this.noteContent,
    required this.onUpdate,
    required this.onDelete,
    this.isPinned = false,
    this.onTap,
    this.noteCategory,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: AppPadding.all12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.noteTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Visibility(
                      visible: !widget.isPinned && _isHovered,
                      child: InkWell(
                        onTap: () => widget.onUpdate(widget.noteId),
                        borderRadius: BorderRadius.circular(8),
                        child: const Icon(Icons.push_pin, size: 16, color: Colors.grey),
                      ),
                    ),
                    Visibility(
                      visible: widget.isPinned,
                      child: InkWell(
                        onTap: () => widget.onUpdate(widget.noteId),
                        borderRadius: BorderRadius.circular(8),
                        child: const Icon(Icons.push_pin, size: 18, color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    widget.noteContent,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: widget.noteCategory != null,
                      child: Row(
                        children: [
                          const Icon(Icons.label_outline, size: 14, color: Colors.grey),
                          AppSpaces.w4,
                          Text(
                            widget.noteCategory ?? '',
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                      visible: _isHovered,
                      child: InkWell(
                        onTap: () => widget.onDelete(widget.noteId),
                        child: const Icon(
                          Icons.delete,
                          size: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
