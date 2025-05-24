import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/widgets/appCard/app_note_card.dart';
import 'package:flutter_ui/desktopPages/todoPage/note/note_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';

class NoteSection extends StatelessWidget {
  final List<Note> notes;
  final List<String> categories;
  final ValueChanged<Note> onSave;
  final ValueChanged<String> onDelete;
  final Function(String) titleOnChanged;
  final Function(String) contentOnChanged;
  final String? titleErrorText;
  final String? contentErrorText;

  const NoteSection({
    super.key,
    required this.notes,
    required this.categories,
    required this.onSave,
    required this.onDelete,
    required this.titleOnChanged,
    required this.contentOnChanged,
    this.titleErrorText,
    this.contentErrorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.all16,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: notes.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return createNote(context);
          }
          final note = notes[index - 1];
          return AppNoteCard(
            noteId: note.id ?? '',
            noteTitle: note.title ?? '',
            noteContent: note.content ?? '',
            noteCategory: note.category,
            isPinned: note.isPinned,
            onDelete: onDelete,
            onUpdate: (updatedNote) {},
            onTap: () => appSheet(
              side: SheetSide.left,
              context: context,
              builder: (_) => NoteSheet(
                note: note,
                categories: categories,
                onSave: onSave,
                titleOnChanged: titleOnChanged,
                contentOnChanged: contentOnChanged,
              ),
            ),
          );
        },
      ),
    );
  }

  Card createNote(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () => appSheet(
          side: SheetSide.left,
          context: context,
          builder: (_) => NoteSheet(
            isCreate: true,
            categories: categories,
            onSave: onSave,
            titleErrorText: titleErrorText,
            contentErrorText: contentErrorText,
            titleOnChanged: titleOnChanged,
            contentOnChanged: contentOnChanged,
          ),
        ),
        child: Padding(
          padding: AppPadding.all12,
          child: Center(
            child: Icon(
              Icons.add,
              size: 42,
            ),
          ),
        ),
      ),
    );
  }
}
