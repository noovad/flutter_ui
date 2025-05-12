import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_form.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TodoSheetType { create, update }

class NoteSheet extends StatefulWidget {
  final TodoSheetType? type;
  final ShadSheetSide side;
  final Note? note;
  final List<String> categories;
  final ValueChanged<Note>? onSave;

  const NoteSheet.create({
    super.key,
    required this.side,
    required this.categories,
    required this.onSave,
  })  : type = TodoSheetType.create,
        note = null;

  const NoteSheet.update({
    super.key,
    required this.side,
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
  late String _selectedCategory;

  bool get isCreate => widget.type == TodoSheetType.create;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController =
        TextEditingController(text: widget.note?.content ?? '');
    _selectedCategory = widget.note?.category ?? 'None';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _handleSave() {
    final note = Note(
      id: isCreate ? null : widget.note?.id,
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      category: _selectedCategory,
    );

    widget.onSave?.call(note);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isCreate = widget.type == TodoSheetType.create;

    return ShadSheet(
      constraints: BoxConstraints(
        minWidth: 520,
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      title: Text(isCreate ? 'Create Note' : 'Details Note'),
      actions: [
        ShadButton.secondary(
          size: ShadButtonSize.sm,
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ShadButton(
          size: ShadButtonSize.sm,
          onPressed: _handleSave,
          child: Text(isCreate ? 'Create' : 'Update'),
        ),
      ],
      child: NoteForm(
        titleController: _titleController,
        contentController: _contentController,
        selectedCategory: _selectedCategory,
        onCategoryChanged: (c) => setState(() => _selectedCategory = c),
        categories: widget.categories,
        theme: theme,
      ),
    );
  }
}
