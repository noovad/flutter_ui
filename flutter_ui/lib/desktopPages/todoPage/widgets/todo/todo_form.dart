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
  final bool isDone;
  final String initialTitle;
  final String initialCategory;
  final DateTime initialDate;
  final String initialNotes;
  final DateTime? initialTime;

  const TodoForm({
    super.key,
    required this.taskType,
    required this.tabsType,
    required this.initialTitle,
    required this.isDone,
    required this.initialCategory,
    required this.initialDate,
    required this.initialNotes,
    this.listCategory,
    this.initialTime,
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
            initialValue: initialTitle,
            enabled: !isDone,
          ),
        ),
        Visibility(
          visible: tabsType != TabsType.auto,
          child: buildFormRow(
            label: 'Category',
            theme: theme,
            child: ShadSelect<String>(
              enabled: !isDone,
              options: [
                ...listCategory!.map(
                  (category) => ShadOption(
                    value: category,
                    child: Text(category),
                  ),
                ),
              ],
              closeOnSelect: false,
              initialValue: initialCategory,
              selectedOptionBuilder: (context, value) => Text(value),
            ),
          ),
        ),
        Visibility(
          child: buildFormRow(
            label: 'Date',
            theme: theme,
            child: ShadDatePicker(
              selected: initialDate,
              enabled: !isDone,
            ),
          ),
        ),
        buildFormRow(
          label: 'Time',
          theme: theme,
          child: ShadTimePickerFormField(
            initialValue: initialTime != null
                ? ShadTimeOfDay.fromDateTime(initialTime!)
                : null,
            validator: (v) => v == null ? 'A time is required' : null,
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
              initialValue: initialNotes,
              onChanged: !isDone ? (value) {} : null,
              minHeight: 400,
              enabled: !isDone,
            ),
          ),
        ),
      ],
    );
  }
}
