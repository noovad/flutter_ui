import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:flutter_ui/widgets/appShimmer/app_shimmer.dart';

class AppTaskShimmerCard extends StatelessWidget {
  final bool withLeading;

  const AppTaskShimmerCard({
    super.key,
    this.withLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        dense: true,
        leading: withLeading
            ? AppShimmer(
                height: 24,
                width: 24,
                shape: ShimmerShape.circle,
              )
            : null,
        title: const AppShimmer(
          height: 16,
          borderRadius: 4,
          shape: ShimmerShape.rectangle,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.h4,
            Row(
              children: [
                const AppShimmer(
                  height: 12,
                  width: 60,
                  borderRadius: 4,
                  shape: ShimmerShape.rectangle,
                ),
                AppSpaces.w16,
                const AppShimmer(
                  height: 12,
                  width: 40,
                  borderRadius: 4,
                  shape: ShimmerShape.rectangle,
                ),
                AppSpaces.w16,
                const AppShimmer(
                  height: 12,
                  width: 80,
                  borderRadius: 4,
                  shape: ShimmerShape.rectangle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
