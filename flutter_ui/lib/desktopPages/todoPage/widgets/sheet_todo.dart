import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoSheet extends StatelessWidget {
  final TodoCardData todoData;
  final ShadSheetSide side;

  const TodoSheet({super.key, required this.side, required this.todoData});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadSheet(
      constraints: side == ShadSheetSide.left || side == ShadSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: const Text('Edit Todo'),
      actions: [
        ShadButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ShadButton(
          child: const Text('Update'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Title',
                    style: theme.textTheme.small,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: Text(":")),
                Expanded(
                  flex: 5,
                  child: ShadInput(initialValue: todoData.title),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Time',
                    style: theme.textTheme.small,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: Text(":")),
                Expanded(
                  flex: 5,
                  child: ShadTimePickerFormField(
                    onChanged: (time) {
                      debugPrint(time.toString());
                    },
                    validator: (v) => v == null ? 'A time is required' : null,
                    hourLabel: const SizedBox.shrink(),
                    minuteLabel: const SizedBox.shrink(),
                    secondLabel: const SizedBox.shrink(),
                    hourPlaceholder: const Text('23'),
                    minutePlaceholder: const Text('59'),
                    secondPlaceholder: const Text('00'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Category',
                    style: theme.textTheme.small,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: Text(":")),
                Expanded(
                  flex: 5,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 180),
                    child: ShadSelect<String>(
                      options: [
                        ...['None', 'Work', 'Personal']
                            .map((category) => ShadOption(
                                  value: category,
                                  child: Text(category),
                                )),
                      ],
                      closeOnSelect: false,
                      initialValue: todoData.category ?? 'None',
                      selectedOptionBuilder: (context, value) => Text(value!),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Notes',
                    style: theme.textTheme.small,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: Text(":")),
                Expanded(
                  flex: 5,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: ShadTextarea(
                      onChanged: (value) {
                        print(value);
                      },
                      minHeight: 150,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
