import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_sheet.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoForm extends StatelessWidget {
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFormRow(
            label: 'Title',
            theme: theme,
            child: ShadInput(
              initialValue: initialTitle,
              enabled: !isDone,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 16),
              _buildFormRow(
                label: 'Category',
                theme: theme,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 180),
                  child: ShadSelect<String>(
                    enabled: !isDone,
                    options: [
                      ...listCategory!.map((category) => ShadOption(
                            value: category,
                            child: Text(category),
                          )),
                    ],
                    closeOnSelect: false,
                    initialValue: initialCategory,
                    selectedOptionBuilder: (context, value) => Text(value),
                    onChanged: !isDone ? (value) {} : null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildFormRow(
            label: 'Date',
            theme: theme,
            child: ShadDatePicker(
              selected: initialDate,
              enabled: !isDone,
            ),
          ),
          const SizedBox(height: 16),
          _buildFormRow(
            label: 'Time',
            theme: theme,
            child: ShadTimePickerFormField(
              initialValue: initialTime != null
                  ? ShadTimeOfDay.fromDateTime(initialTime!)
                  : null,
              onChanged: !isDone ? (time) => debugPrint(time.toString()) : null,
              validator: (v) => v == null ? 'A time is required' : null,
              hourLabel: const SizedBox.shrink(),
              minuteLabel: const SizedBox.shrink(),
              secondLabel: const SizedBox.shrink(),
              hourPlaceholder: const Text('23'),
              minutePlaceholder: const Text('59'),
              secondPlaceholder: const Text('00'),
            ),
          ),
          const SizedBox(height: 16),
          _buildFormRow(
            label: 'Notes',
            theme: theme,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ShadTextarea(
                initialValue: initialNotes,
                onChanged: !isDone ? (value) {} : null,
                minHeight: 150,
                enabled: !isDone,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormRow({
    required String label,
    required ShadThemeData theme,
    required Widget child,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.small,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: Text(":")),
        Expanded(
          flex: 5,
          child: child,
        ),
      ],
    );
  }
}
