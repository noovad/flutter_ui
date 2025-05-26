// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appShimmer/app_shimmer.dart';
import 'package:widgetbook/widgetbook.dart';

final shimmer = WidgetbookComponent(
  name: 'App Shimmer',
  useCases: [
    WidgetbookUseCase(
      name: 'Rectangle',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
            child: AppShimmer(
          height: 300,
          width: 300,
          shape: ShimmerShape.rectangle,
        )),
      ),
    ),
    WidgetbookUseCase(
      name: 'Circle',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Center(
            child: AppShimmer(
          width: 300,
          shape: ShimmerShape.rectangle,
        )),
      ),
    ),
  ],
);
