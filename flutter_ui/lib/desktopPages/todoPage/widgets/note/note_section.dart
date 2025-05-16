import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/component/app_sheet.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';

class NoteSection extends StatelessWidget {
  final List<Note> notes;
  final List<String> categories;
  final ValueChanged<Note> onSave;
  final ValueChanged<Note> onDelete;

  const NoteSection({
    super.key,
    required this.notes,
    required this.categories,
    required this.onSave,
    required this.onDelete,
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
          return NoteCard(
            note: note,
            categories: categories,
            onDelete: onDelete,
            onSave: onSave,
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
        onTap: () => showSheet(
          side: SheetSide.left,
          context: context,
          builder: (_) => NoteSheet.create(
            categories: categories,
            onSave: onSave,
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
