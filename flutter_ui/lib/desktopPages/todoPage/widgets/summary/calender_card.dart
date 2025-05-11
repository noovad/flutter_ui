import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_text_style.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CalenderCard extends StatelessWidget {
  final String sholatCount;
  final int? amount;
  final bool hasCoding;
  final bool hasGym;
  final bool hasCardio;
  final bool isSunday;

  const CalenderCard({
    super.key,
    required this.sholatCount,
    required this.amount,
    required this.hasCoding,
    required this.hasGym,
    required this.hasCardio,
    required this.isSunday,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey,
      color: _getDayCardColor(isSunday),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                sholatCount.toString(),
                style: ShadTheme.of(context).textTheme.table,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (hasCoding)
                  const Icon(LucideIcons.code, color: Colors.red, size: 18),
                if (hasCoding && hasGym) const SizedBox(width: 4),
                if (hasGym)
                  const Icon(LucideIcons.bicepsFlexed,
                      color: Colors.blue, size: 18),
                if ((hasCoding || hasGym) && hasCardio)
                  const SizedBox(width: 4),
                if (hasCardio)
                  const Icon(LucideIcons.heartPlus,
                      color: Colors.white, size: 18),
              ],
            ),
            if (amount != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  amount.toString(),
                  style: AppTextStyle.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getDayCardColor(bool isSunday) =>
      isSunday ? const Color(0xFF222222) : Colors.black;
}
