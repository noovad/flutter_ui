import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_content.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TodoSheetType { create, detail }

enum TaskType { daily, productivity }

class TodoSheet extends StatelessWidget {
  final TodoSheetType type;
  final TabsType? tabsType;
  final TaskType? taskType;
  final ShadSheetSide side;
  final TodoCardData? todoData;
  final VoidCallback? onSave;
  final List<String> listCategory;

  const TodoSheet.create({
    super.key,
    required this.side,
    required this.onSave,
    required this.tabsType,
    required this.taskType,
    required this.listCategory,
  })  : type = TodoSheetType.create,
        todoData = null;

  const TodoSheet.detail({
    super.key,
    required this.side,
    required this.todoData,
    required this.taskType,
    required this.listCategory,
    this.onSave,
  })  : type = TodoSheetType.detail,
        tabsType = null;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    switch (type) {
      case TodoSheetType.create:
        return _createSheet(context, theme);
      case TodoSheetType.detail:
        return _detailSheet(context, theme);
    }
  }

  ShadSheet _createSheet(BuildContext context, ShadThemeData theme) {
    return ShadSheet(
      constraints: _getSheetConstraints(),
      title: taskType == TaskType.daily
          ? Text('Create Todo Daily')
          : Text('Create Todo Productivity'),
      actions: [
        ShadButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ShadButton(
          child: const Text('Create'),
          onPressed: () {
            if (onSave != null) onSave!();
            Navigator.of(context).pop();
          },
        ),
      ],
      child: _TodoForm(
        listCategory: listCategory,
        taskType: taskType,
        isDone: false,
        initialTitle: '',
        initialCategory: 'None',
        initialNotes: '',
        initialDate: tabsType == TabsType.upcoming
            ? DateTime.now().add(const Duration(days: 1))
            : DateTime.now(),
        initialTime: null,
      ),
    );
  }

  ShadSheet _detailSheet(BuildContext context, ShadThemeData theme) {
    return ShadSheet(
      constraints: _getSheetConstraints(),
      title: taskType == TaskType.daily
          ? Text('Detail Todo Daily')
          : Text('Detail Todo Productivity'),
      actions: [
        Visibility(
          visible: !(todoData?.isDone ?? false),
          child: ShadButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Visibility(
          visible: !(todoData?.isDone ?? false),
          child: ShadButton(
            child: const Text('Detail'),
            onPressed: () {
              if (onSave != null) onSave!();
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
      child: _TodoForm(
          listCategory: listCategory,
          taskType: taskType,
          isDone: todoData!.isDone,
          initialTitle: todoData!.title,
          initialCategory: todoData!.category ?? 'None',
          initialNotes: todoData!.note ?? '',
          initialDate: todoData!.date,
          initialTime: todoData!.time),
    );
  }

  BoxConstraints? _getSheetConstraints() {
    return side == ShadSheetSide.left || side == ShadSheetSide.right
        ? const BoxConstraints(maxWidth: 512)
        : null;
  }
}

class _TodoForm extends StatelessWidget {
  final List<String>? listCategory;
  final TaskType? taskType;
  final bool isDone;
  final String initialTitle;
  final String initialCategory;
  final DateTime initialDate;
  final String initialNotes;
  final DateTime? initialTime;

  const _TodoForm({
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
          Visibility(
            visible: taskType == TaskType.productivity,
            child: Column(
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
