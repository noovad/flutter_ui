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
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: length,
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 0.25,
                    ),
                  ),
                  child: TabBar(
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
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
