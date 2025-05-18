import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/note/note_form.dart';

enum TodoSheetType { create, update }

class NoteSheet extends StatefulWidget {
  final TodoSheetType? type;
  final Note? note;
  final List<String> categories;
  final ValueChanged<Note>? onSave;

  const NoteSheet.create({
    super.key,
    required this.categories,
    required this.onSave,
  })  : type = TodoSheetType.create,
        note = null;

  const NoteSheet.update({
    super.key,
    required this.note,
    required this.categories,
    required this.onSave,
  }) : type = null;

  @override
  State<NoteSheet> createState() => _NoteSheetState();
}

class _NoteSheetState extends State<NoteSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late final TextEditingController _categoryController;

  bool get isCreate => widget.type == TodoSheetType.create;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController = TextEditingController(text: widget.note?.content ?? '');
    _categoryController = TextEditingController(text: widget.note?.category ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _handleSave() {
    final note = Note(
      id: isCreate ? null : widget.note?.id,
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      category: _categoryController.text.trim(),
    );

    widget.onSave?.call(note);
  }

  @override
  Widget build(BuildContext context) {
    final isCreate = widget.type == TodoSheetType.create;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: NoteForm(
                titleController: _titleController,
                contentController: _contentController,
                categories: widget.categories,
                categoryController: _categoryController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: isCreate
                  ? [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _handleSave,
                        child: const Text('Create'),
                      ),
                    ]
                  : [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('Update note pressed');
                          _handleSave();
                        },
                        child: const Text('Update'),
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}
