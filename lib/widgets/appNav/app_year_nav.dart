import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:intl/intl.dart';

class AppYearNav extends StatefulWidget {
  final Function(DateTime)? onChange;
  final MainAxisAlignment mainAxisAlignment;
  final DateTime? initialDate;

  const AppYearNav({
    super.key,
    this.onChange,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.initialDate,
  });

  @override
  State<AppYearNav> createState() => _AppYearNavState();
}

class _AppYearNavState extends State<AppYearNav> {
  late final ValueNotifier<DateTime> displayedDate;

  @override
  void initState() {
    super.initState();
    displayedDate =
        ValueNotifier<DateTime>(widget.initialDate ?? DateTime.now());

    if (widget.onChange != null) {
      widget.onChange!(displayedDate.value);
    }
  }

  @override
  void dispose() {
    displayedDate.dispose();
    super.dispose();
  }

  void _changeYear(int offset) {
    final current = displayedDate.value;
    final newDate = DateTime(current.year + offset, current.month, 1);
    displayedDate.value = newDate;

    if (widget.onChange != null) {
      widget.onChange!(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        IconButton(
          onPressed: () => _changeYear(-1),
          icon: const Icon(Icons.chevron_left, size: 18),
          color: colorScheme.onPrimary,
        ),
        AppSpaces.w8,
        ValueListenableBuilder<DateTime>(
            valueListenable: displayedDate,
            builder: (context, date, _) {
              return SizedBox(
                width: 80,
                child: Center(
                  child: Text(DateFormat('yyyy').format(date),
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              );
            }),
        AppSpaces.w8,
        IconButton(
          onPressed: () => _changeYear(1),
          icon: const Icon(Icons.chevron_right, size: 18),
          color: colorScheme.onPrimary,
        ),
      ],
    );
  }
}
