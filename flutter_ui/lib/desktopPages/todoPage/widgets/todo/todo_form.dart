import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/build_form_row.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoForm extends StatelessWidget {
  final TabsType? tabsType;
  final List<String>? listCategory;
  final TaskType? taskType;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;
  final bool status;
  final TextEditingController titleController;
  final TextEditingController noteController;
  final TextEditingController dateController;
  final TextEditingController timeController;

  const TodoForm({
    super.key,
    required this.taskType,
    required this.tabsType,
    required this.status,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.titleController,
    required this.noteController,
    required this.dateController,
    required this.timeController,
    this.listCategory,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      spacing: AppSizes.dimen16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildFormRow(
          label: 'Title',
          theme: theme,
          child: ShadInput(
            initialValue: titleController.text,
            enabled: !status,
            onChanged: (value) {
              titleController.text = value;
            },
          ),
        ),
        Visibility(
          visible: tabsType != TabsType.auto,
          child: buildFormRow(
            label: 'Category',
            theme: theme,
            child: ShadSelect<String>(
              enabled: !status,
              options: [
                ...listCategory!.map(
                  (category) => ShadOption(
                    value: category,
                    child: Text(category),
                  ),
                ),
              ],
              closeOnSelect: false,
              initialValue: selectedCategory,
              selectedOptionBuilder: (context, value) => Text(value),
              onChanged: (value) {
                if (value != null) {
                  onCategoryChanged(value);
                }
              },
            ),
          ),
        ),
        Visibility(
          child: buildFormRow(
            label: 'Date',
            theme: theme,
            child: ShadDatePicker(
              selected: dateController.text.isNotEmpty ? DateTime.tryParse(dateController.text) : null,
              enabled: !status,
              onChanged: (value) {
                if (value != null) {
                  dateController.text = value.toString();
                }
              },
            ),
          ),
        ),
        buildFormRow(
          label: 'Time',
          theme: theme,
          child: ShadTimePickerFormField(
            initialValue: timeController.text.isNotEmpty
                ? ShadTimeOfDay.fromDateTime(
                    DateTime.parse('1970-01-01T${timeController.text}'),
                  )
                : null,
            onChanged: (value) {
              if (value != null) {
                final formattedTime = '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
                timeController.text = formattedTime;
              }
            },
            hourLabel: const SizedBox.shrink(),
            minuteLabel: const SizedBox.shrink(),
            secondLabel: const SizedBox.shrink(),
            hourPlaceholder: const Text('23'),
            minutePlaceholder: const Text('59'),
            secondPlaceholder: const Text('00'),
          ),
        ),
        buildFormRow(
          label: 'Notes',
          theme: theme,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ShadTextarea(
              initialValue: noteController.text,
              onChanged: (value) {
                noteController.text = value;
              },
              minHeight: 400,
              enabled: !status,
            ),
          ),
        ),
      ],
    );
  }
}
