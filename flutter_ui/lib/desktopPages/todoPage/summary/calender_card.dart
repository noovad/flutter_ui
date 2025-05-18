import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_text_style.dart';

class CalenderCard extends StatelessWidget {
  final String sholatCount;
  final int? amount;
  final bool hasCoding;
  final bool hasGym;
  final bool hasCardio;
  final bool isSunday;
  final bool calorieControlled;

  const CalenderCard({
    super.key,
    required this.sholatCount,
    required this.amount,
    required this.hasCoding,
    required this.hasGym,
    required this.hasCardio,
    required this.isSunday,
    required this.calorieControlled,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey,
      // todo: add color to the card
      // color: _getDayCardColor(isSunday),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
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
                    sholatCount.toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                if (hasCoding)
                  const Tooltip(
                    message: 'Coding',
                    child: Icon(Icons.code, color: Colors.red, size: 18),
                  ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (hasGym)
                  const Tooltip(
                    message: 'Gym',
                    child: Icon(Icons.fitness_center, size: 18),
                  ),
                if (hasGym && hasCardio) const SizedBox(width: 4),
                if (calorieControlled)
                  const Tooltip(
                    message: 'Calorie Controlled',
                    child: Icon(Icons.restaurant, size: 18),
                  ),
                if (hasCardio && calorieControlled) const SizedBox(width: 4),
                if (hasCardio)
                  const Tooltip(
                    message: 'Cardio',
                    child: Icon(Icons.favorite, size: 18),
                  ),
              ],
            ),
            if (amount != null)
              Tooltip(
                message: 'Expenses (K)',
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    amount.toString(),
                    style: AppTextStyle.bodySmall,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Color _getDayCardColor(bool isSunday) => isSunday ? const Color(0xFF222222) : null;
}
