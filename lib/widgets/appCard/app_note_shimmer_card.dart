import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/widgets/appShimmer/app_shimmer.dart';

class AppNoteShimmerCard extends StatelessWidget {
  const AppNoteShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Colors.black.withOpacity(0.3),
          width: 0.25,
        ),
      ),
      child: Padding(
        padding: AppPadding.all12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppSpaces.h4,
            Row(
              children: [
                const Expanded(
                  child: AppShimmer(
                    height: 16,
                    borderRadius: 4,
                    shape: ShimmerShape.rectangle,
                  ),
                ),
                AppSpaces.w8,
                const AppShimmer(
                  height: 18,
                  width: 18,
                  shape: ShimmerShape.circle,
                ),
              ],
            ),
            AppSpaces.h8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppShimmer(
                    height: 14,
                    borderRadius: 4,
                    shape: ShimmerShape.rectangle,
                  ),
                  AppSpaces.h4,
                  const AppShimmer(
                    height: 14,
                    width: 240,
                    borderRadius: 4,
                    shape: ShimmerShape.rectangle,
                  ),
                  AppSpaces.h4,
                  const AppShimmer(
                    height: 14,
                    width: 180,
                    borderRadius: 4,
                    shape: ShimmerShape.rectangle,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    const AppShimmer(
                      height: 14,
                      width: 14,
                      shape: ShimmerShape.circle,
                    ),
                    AppSpaces.w4,
                    const AppShimmer(
                      height: 12,
                      width: 80,
                      borderRadius: 4,
                      shape: ShimmerShape.rectangle,
                    ),
                  ],
                ),
                const Spacer(),
                const AppShimmer(
                  height: 14,
                  width: 14,
                  shape: ShimmerShape.circle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
