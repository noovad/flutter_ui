import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';

class AppDailySummaryCard extends StatelessWidget {
  final String sholatCount;
  final int? amount;
  final bool hasCoding;
  final bool hasGym;
  final bool hasCardio;
  final bool isSunday;
  final bool calorieControlled;
  final bool isToday;

  const AppDailySummaryCard({
    super.key,
    required this.sholatCount,
    required this.amount,
    required this.hasCoding,
    required this.hasGym,
    required this.hasCardio,
    required this.isSunday,
    required this.calorieControlled,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      shadowColor: isSunday ? colorScheme.tertiary : colorScheme.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isToday ? colorScheme.tertiary : colorScheme.outline,
          width: isToday ? 1 : 0.25,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tooltip(
                  message: 'Sholat Count',
                  child: Text(
                    sholatCount != '0' ? sholatCount.toString() : '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                if (hasCoding)
                  Tooltip(
                    message: 'Coding',
                    child: Icon(
                      Icons.code,
                      color: colorScheme.tertiary,
                      size: 18,
                    ),
                  ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (hasGym)
                  Tooltip(
                    message: 'Gym',
                    child: Icon(
                      Icons.fitness_center,
                      size: 18,
                    ),
                  ),
                if (hasGym && hasCardio) AppSpaces.w4,
                if (calorieControlled)
                  Tooltip(
                    message: 'Calorie Controlled',
                    child: Icon(
                      Icons.restaurant,
                      size: 18,
                    ),
                  ),
                if (hasCardio && calorieControlled) AppSpaces.w4,
                if (hasCardio)
                  Tooltip(
                    message: 'Cardio',
                    child: Icon(
                      Icons.favorite,
                      size: 18,
                    ),
                  ),
              ],
            ),
            if (amount != null)
              Tooltip(
                message: 'Expenses (K)',
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    amount == 0 ? '' : amount.toString(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
