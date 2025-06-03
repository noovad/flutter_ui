import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:intl/intl.dart';

class AppDateNav extends StatefulWidget {
  final Function(DateTime)? onChange;
  final MainAxisAlignment mainAxisAlignment;

  const AppDateNav({
    super.key,
    this.onChange,
    this.mainAxisAlignment = MainAxisAlignment.end,
  });

  @override
  State<AppDateNav> createState() => _AppDateNavState();
}

class _AppDateNavState extends State<AppDateNav> {
  late final ValueNotifier<DateTime> displayedDate;

  @override
  void initState() {
    super.initState();
    displayedDate = ValueNotifier<DateTime>(DateTime.now());

    if (widget.onChange != null) {
      widget.onChange!(displayedDate.value);
    }
  }

  @override
  void dispose() {
    displayedDate.dispose();
    super.dispose();
  }

  void _changeMonth(int offset) {
    final current = displayedDate.value;
    final newDate = DateTime(current.year, current.month + offset, 1);
    displayedDate.value = newDate;

    if (widget.onChange != null) {
      widget.onChange!(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        IconButton(
          onPressed: () => _changeMonth(-1),
          icon: const Icon(Icons.chevron_left, size: 18),
        ),
        AppSpaces.w8,
        ValueListenableBuilder<DateTime>(
            valueListenable: displayedDate,
            builder: (context, date, _) {
              return SizedBox(
                width: 140,
                child: Center(
                  child: Text(DateFormat('MMMM / yyyy').format(date),
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              );
            }),
        AppSpaces.w8,
        IconButton(
          onPressed: () => _changeMonth(1),
          icon: const Icon(Icons.chevron_right, size: 18),
        ),
      ],
    );
  }
}
