import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_form.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TodoSheetType { create }

class NoteSheet extends StatelessWidget {
  final TodoSheetType? type;
  final ShadSheetSide side;
  final Note? note;
  final List<String> categories;

  const NoteSheet.create({
    super.key,
    required this.side,
    required this.categories,
  })  : type = TodoSheetType.create,
        note = null;

  const NoteSheet({
    super.key,
    required this.side,
    required this.note,
    required this.categories,
  }) : type = null;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isCreate = type == TodoSheetType.create;

    return ShadSheet(
      constraints: BoxConstraints(
        minWidth: 520,
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      title: Text(isCreate ? 'Create Note' : 'Details Note'),
      actions: isCreate
          ? [
              ShadButton(
                size: ShadButtonSize.sm,
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ShadButton(
                size: ShadButtonSize.sm,
                child: const Text('Create'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]
          : [
              ShadButton(
                size: ShadButtonSize.sm,
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ShadButton(
                size: ShadButtonSize.sm,
                child: const Text('Update'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
      child: NoteForm(
        title: isCreate ? '' : note!.title,
        content: isCreate ? '' : note!.content,
        category: isCreate ? "None" : (note!.category ?? "None"),
        categories: categories,
        theme: theme,
      ),
    );
  }
}
