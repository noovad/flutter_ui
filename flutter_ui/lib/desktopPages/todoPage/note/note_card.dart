import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:flutter_ui/widgets/appSheet/app_sheet.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/note/note_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  final ValueChanged<Note> onDelete;
  final List<String> categories;
  final ValueChanged<Note> onSave;
  final Function(String) titleOnChanged;
  final Function(String) contentOnChanged;
  final String? titleErrorText;
  final String? contentErrorText;

  const NoteCard({
    super.key,
    required this.note,
    required this.categories,
    required this.onSave,
    required this.onDelete,
    required this.titleOnChanged,
    required this.contentOnChanged,
    this.titleErrorText,
    this.contentErrorText,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool _isHovered = false;

  void _openNoteSheet() {
    showSheet(
      side: SheetSide.left,
      context: context,
      builder: (_) => NoteSheet(
        note: widget.note,
        categories: widget.categories,
        onSave: widget.onSave,
        titleOnChanged: widget.titleOnChanged,
        contentOnChanged: widget.contentOnChanged,
      ),
    );
  }

  void _togglePin() {
    final Note updatedNote = Note(
      id: widget.note.id,
      isPinned: !widget.note.isPinned,
    );

    widget.onSave(updatedNote);
  }

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
          onTap: _openNoteSheet,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: AppPadding.all12,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.note.title!,
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
                      child: InkWell(
                        onTap: () {
                          _togglePin();
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Icon(Icons.push_pin, size: 16, color: Colors.grey),
                      ),
                    ),
                    Visibility(
                      visible: widget.note.isPinned,
                      child: InkWell(
                        onTap: () {
                          _togglePin();
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Icon(Icons.push_pin, size: 18, color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    widget.note.content!,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Visibility(
                  visible: widget.note.category != null,
                  child: Row(
                    children: [
                      const Icon(Icons.label_outline, size: 14, color: Colors.grey),
                      AppSpaces.w4,
                      Text(
                        widget.note.category ?? '',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Visibility(
                        visible: _isHovered,
                        child: Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () => widget.onDelete(widget.note),
                              child: Icon(
                                Icons.delete,
                                size: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
