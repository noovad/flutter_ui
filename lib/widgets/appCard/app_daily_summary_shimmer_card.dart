import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:flutter_ui/widgets/appShimmer/app_shimmer.dart';

class AppDailySummaryShimmerCard extends StatelessWidget {
  final bool isSunday;

  const AppDailySummaryShimmerCard({
    super.key,
    this.isSunday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: isSunday ? Colors.red : Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Colors.black.withOpacity(0.3),
          width: 0.25,
        ),
      ),
      child: Padding(
        padding: AppPadding.all8,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sholat count shimmer
                const AppShimmer(
                  height: 12,
                  width: 12,
                  shape: ShimmerShape.rectangle,
                  borderRadius: 4,
                ),

                // Coding icon shimmer
                const AppShimmer(
                  height: 12,
                  width: 12,
                  shape: ShimmerShape.rectangle,
                  borderRadius: 4,
                ),
              ],
            ),
            const Spacer(),
            // Activity icons shimmer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppShimmer(
                  height: 18,
                  width: 18,
                  shape: ShimmerShape.circle,
                ),
                AppSpaces.w4,
                const AppShimmer(
                  height: 18,
                  width: 18,
                  shape: ShimmerShape.circle,
                ),
                AppSpaces.w4,
                const AppShimmer(
                  height: 18,
                  width: 18,
                  shape: ShimmerShape.circle,
                ),
              ],
            ),
            // Amount shimmer
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: AppShimmer(
                height: 16,
                width: 50,
                shape: ShimmerShape.rectangle,
                borderRadius: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
