import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_card.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';

class NoteSection extends StatelessWidget {
  final List<Note> notes;
  const NoteSection({
    super.key,
    required this.notes,
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
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return NoteCard(
            note: note,
            onEdit: null,
            onDelete: null,
          );
        },
      ),
    );
  }
}
