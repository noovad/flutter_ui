import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/build_form_row.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EditProfileSheet extends StatelessWidget {
  final ShadSheetSide side;
  final Note note;
  final List<String> categories;

  const EditProfileSheet({
    super.key,
    required this.side,
    required this.note,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadSheet(
      constraints: BoxConstraints(
        minWidth: 520,
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      title: const Text('Details Note'),
      actions: const [
        ShadButton(child: Text('Update')),
      ],
      child: Column(
        spacing: AppSizes.dimen16,
        children: [
          buildFormRow(
            label: 'Title',
            theme: theme,
            child: ShadInput(
              initialValue: note.title,
              enabled: true,
            ),
          ),
          buildFormRow(
            label: 'Category',
            theme: theme,
            child: ShadSelect<String>(
              options: [
                ...categories.map(
                  (category) => ShadOption(
                    value: category,
                    child: Text(category),
                  ),
                ),
              ],
              closeOnSelect: false,
              initialValue: note.category,
              selectedOptionBuilder: (context, value) => Text(value),
            ),
          ),
          buildFormRow(
            label: 'Notes',
            theme: theme,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ShadTextarea(
                initialValue: note.content,
                minHeight: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
