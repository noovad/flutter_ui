import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final List<String> categories;

  const NoteCard({
    super.key,
    required this.note,
    required this.categories,
    this.onDelete,
    this.onEdit,
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
        child: Padding(
          padding: AppPadding.all12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.note.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Visibility(
                    visible: !widget.note.isPinned && _isHovered,
                    child: Row(
                      children: [
                        Icon(Icons.push_pin, size: 18, color: Colors.grey),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.note.isPinned,
                    child: Row(
                      children: [
                        Icon(Icons.push_pin, size: 18, color: Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: InkWell(
                  onTap: () => showShadSheet(
                    side: ShadSheetSide.left,
                    context: context,
                    builder: (context) => NoteSheet(
                      side: ShadSheetSide.left,
                      note: widget.note,
                      categories: widget.categories,
                    ),
                  ),
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    widget.note.content,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Visibility(
                visible: widget.note.category != null,
                child: Row(
                  children: [
                    const Icon(Icons.label_outline,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      widget.note.category ?? '',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
