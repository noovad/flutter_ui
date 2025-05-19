import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/note/note_form.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';

class NoteSheet extends StatefulWidget {
  final Note? note;
  final List<String> categories;
  final bool isCreate;
  final String? titleErrorText;
  final String? contentErrorText;
  final ValueChanged<Note>? onSave;
  final Function(String) titleOnChanged;
  final Function(String) contentOnChanged;

  const NoteSheet({
    super.key,
    required this.categories,
    required this.titleOnChanged,
    required this.contentOnChanged,
    this.note,
    this.isCreate = false,
    this.titleErrorText,
    this.contentErrorText,
    this.onSave,
  });

  @override
  State<NoteSheet> createState() => _NoteSheetState();
}

class _NoteSheetState extends State<NoteSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late final TextEditingController _categoryController;

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
      id: widget.isCreate ? null : widget.note?.id,
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      category: _categoryController.text.trim(),
    );

    widget.onSave?.call(note);
  }

  @override
  Widget build(BuildContext context) {
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
                titleErrorText: widget.titleErrorText,
                contentErrorText: widget.contentErrorText,
                titleOnChanged: widget.titleOnChanged,
                contentOnChanged: widget.contentOnChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.isCreate
                  ? [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      AppSpaces.w8,
                      ElevatedButton(
                        onPressed: () {
                          _handleSave();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Create'),
                      ),
                    ]
                  : [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      AppSpaces.w8,
                      ElevatedButton(
                        onPressed: _handleSave,
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
