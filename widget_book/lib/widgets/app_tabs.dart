import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appTabs/app_tabs.dart';
import 'package:widgetbook/widgetbook.dart';

final tabs = WidgetbookComponent(
  name: 'tabs',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
          child: AppTabs(
            length: 4,
            tabBar: [
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
            tabBarView: [
              Center(child: Text("Content 1")),
              Center(child: Text("Content 2")),
              Center(child: Text("Content 3")),
              Center(child: Text("Content 4")),
            ],
          ),
        ),
      ),
    ),
  ],
);
