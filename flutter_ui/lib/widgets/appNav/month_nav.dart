import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthNav extends StatelessWidget {
  final ValueNotifier<DateTime> displayedDate;

  const MonthNav({
    super.key,
    required this.displayedDate,
  });

  void _changeMonth(int offset) {
    final current = displayedDate.value;
    displayedDate.value = DateTime(current.year, current.month + offset, 1);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: displayedDate,
      builder: (context, date, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 8,
          children: [
            IconButton(
              onPressed: () => _changeMonth(-1),
              icon: const Icon(Icons.chevron_left, size: 18),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                padding: const EdgeInsets.all(4),
                minimumSize: const Size(28, 28),
              ),
              color: Colors.white,
            ),
            SizedBox(
              width: 140,
              child: Center(
                child: Text(
                  DateFormat('MMMM / yyyy').format(date),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => _changeMonth(1),
              icon: const Icon(Icons.chevron_right, size: 18),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                padding: const EdgeInsets.all(4),
                minimumSize: const Size(28, 28),
              ),
              color: Colors.white,
            ),
          ],
        );
      },
    );
  }
}
