import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/build_form_row.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NoteForm extends StatelessWidget {
  final String title;
  final String content;
  final String category;
  final List<String> categories;
  final ShadThemeData theme;

  const NoteForm({
    super.key,
    required this.title,
    required this.content,
    required this.category,
    required this.categories,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.dimen16,
      children: [
        buildFormRow(
          label: 'Title',
          theme: theme,
          child: ShadInput(
            initialValue: title,
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
            initialValue: category,
            selectedOptionBuilder: (context, value) => Text(value),
          ),
        ),
        buildFormRow(
          label: 'Notes',
          theme: theme,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ShadTextarea(
              initialValue: content,
              minHeight: 400,
            ),
          ),
        ),
      ],
    );
  }
}
