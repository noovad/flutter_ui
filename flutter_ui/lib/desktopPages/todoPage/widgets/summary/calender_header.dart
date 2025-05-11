import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CalenderHeader extends StatelessWidget {
  final ValueNotifier<DateTime> displayedDate;
  final BuildContext context;
  final DateTime date;

  const CalenderHeader({
    super.key,
    required this.displayedDate,
    required this.context,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.secondary(
          size: ShadButtonSize.sm,
          child: const Icon(LucideIcons.chevronLeft),
          onPressed: () {
            displayedDate.value = DateTime(
              date.year,
              date.month - 1,
              1,
            );
          },
        ),
        Text(
          '${months[date.month - 1]} / ${date.year}',
          style: ShadTheme.of(context).textTheme.p,
        ),
        const SizedBox(width: 8),
        ShadButton.secondary(
          size: ShadButtonSize.sm,
          child: const Icon(LucideIcons.chevronRight),
          onPressed: () {
            displayedDate.value = DateTime(
              date.year,
              date.month + 1,
              1,
            );
          },
        ),
      ],
    );
  }
}
