// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appCard/app_daily_summary_card.dart';
import 'package:flutter_ui/widgets/appCard/app_daily_summary_shimmer_card.dart';
import 'package:flutter_ui/widgets/appCard/app_note_card.dart';
import 'package:flutter_ui/widgets/appCard/app_note_shimmer_card.dart';
import 'package:flutter_ui/widgets/appCard/app_task_card.dart';
import 'package:flutter_ui/widgets/appCard/app_task_shimmer_card.dart';
import 'package:widgetbook/widgetbook.dart';

final card = WidgetbookComponent(
  name: 'App Card',
  useCases: [
    WidgetbookUseCase(
      name: 'Summary Card',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: AppDailySummaryCard(
                isToday: true,
                amount: 20,
                calorieControlled: true,
                sholatCount: '',
                hasCoding: true,
                hasGym: true,
                hasCardio: true,
                isSunday: true,
              ),
            ),
            SizedBox(
                width: 100, height: 100, child: AppDailySummaryShimmerCard())
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Note Card',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: AppNoteCard(
                noteContent: 'This is a dummy note content.',
                noteId: 'dummy_id',
                noteTitle: 'Dummy Note',
                onUpdate: (value) {
                  print('Update called with value: $value');
                },
                onDelete: (value) {
                  print('Delete called with value: $value');
                },
              ),
            ),
            SizedBox(width: 250, height: 250, child: AppNoteShimmerCard())
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Task Card',
      builder: (context) => MaterialApp(
        theme: AppTheme.lightTheme(),
        home: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 75,
              child: AppTaskCard(
                id: 'task_id',
                isDone: false,
                title: 'Task Title',
                category: 'Work',
                time: '10:00 AM',
                date: '2023-10-01',
                leading: true,
                onDelete: () {
                  print('Delete task');
                },
                onUpdateStatus: () {
                  print('Update task status');
                },
                ontap: () {
                  print('Task tapped');
                },
              ),
            ),
            SizedBox(width: 500, height: 75, child: AppTaskShimmerCard())
          ],
        ),
      ),
    ),
  ],
);
