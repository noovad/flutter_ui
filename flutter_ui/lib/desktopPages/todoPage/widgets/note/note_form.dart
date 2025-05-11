import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/build_form_row.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NoteForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String> onCategoryChanged;
  final ShadThemeData theme;

  const NoteForm({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.selectedCategory,
    required this.categories,
    required this.onCategoryChanged,
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
            initialValue: titleController.text,
            enabled: true,
            onChanged: (value) {
              titleController.text = value;
            },
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
            initialValue: selectedCategory,
            onChanged: (value) {
              if (value != null) {
                onCategoryChanged(value);
              }
            },
            selectedOptionBuilder: (context, value) => Text(value),
          ),
        ),
        buildFormRow(
          label: 'Content',
          theme: theme,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ShadTextarea(
              initialValue: contentController.text,
              minHeight: 400,
              onChanged: (value) {
                contentController.text = value;
              },
            ),
          ),
        ),
      ],
    );
  }
}
