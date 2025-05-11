import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note/note_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NoteSection extends StatelessWidget {
  final List<Note> notes;
  final List<String> categories;
  const NoteSection({
    super.key,
    required this.notes,
    required this.categories,
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
            onEdit: null,
            onDelete: null,
          );
        },
      ),
    );
  }

  Card createNote(BuildContext context) {
    return Card(
      elevation: 4,
      color: Color(0xFF27272A),
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () => showShadSheet(
          side: ShadSheetSide.left,
          context: context,
          builder: (context) => NoteSheet.create(
            side: ShadSheetSide.left,
            categories: categories,
          ),
        ),
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
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
