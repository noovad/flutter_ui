import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appTabs/app_tabs.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Tabs', type: AppTabs, path: 'Widget')
Widget tabsUseCase(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: AppTabs(
        length: 4,
        tabBar: const [
          Tab(
            child: Text("Tab 1"),
          ),
          Tab(
            child: Text("Tab 2"),
          ),
          Tab(
            child: Text("Tab 3"),
          ),
          Tab(
            child: Text("Tab 4"),
          ),
        ],
        tabBarView: const [
          Center(child: Text("Content 1")),
          Center(child: Text("Content 2")),
          Center(child: Text("Content 3")),
          Center(child: Text("Content 4")),
        ],
      ),
    ),
  );
}
