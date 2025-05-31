import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';

class AppTabs extends StatelessWidget {
  final int length;
  final List<Widget> tabBar;
  final List<Widget> tabBarView;

  final Widget? tabBarChild;

  const AppTabs({
    super.key,
    required this.length,
    required this.tabBar,
    required this.tabBarView,
    this.tabBarChild,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: length,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  child: TabBar(
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorScheme.primary,
                    ),
                    unselectedLabelColor: colorScheme.primary,
                    labelColor: colorScheme.onPrimary,
                    padding: AppPadding.all8,
                    tabs: tabBar,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 0,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              AppSpaces.w12,
              tabBarChild ?? const SizedBox(),
            ],
          ),
          AppSpaces.h16,
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              children: tabBarView,
            ),
          ),
        ],
      ),
    );
  }
}
