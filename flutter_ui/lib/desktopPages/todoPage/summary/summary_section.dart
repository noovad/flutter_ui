import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/summary/calender.dart';
import 'package:flutter_ui/widgets/appNav/month_nav.dart';

class SummarySection extends StatefulWidget {
  final List<DailyActivity> dailyActivities;
  const SummarySection({super.key, required this.dailyActivities});

  @override
  State<SummarySection> createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  late final ValueNotifier<DateTime> displayedDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    displayedDate = ValueNotifier<DateTime>(DateTime(now.year, now.month, 1));
  }

  @override
  void dispose() {
    displayedDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: displayedDate,
      builder: (context, date, _) {
        final daysInMonth = DateTime(date.year, date.month + 1, 0).day;
        final startDay = DateTime(date.year, date.month, 1).weekday % 7;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MonthNav(
                displayedDate: displayedDate,
              ),
              const SizedBox(height: 12),
              Calender(daysInMonth: daysInMonth, startDay: startDay, widget: widget, date: date),
            ],
          ),
        );
      },
    );
  }
}
