import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appCard/app_daily_summary_card.dart';
import 'package:flutter_ui/widgets/appCard/app_daily_summary_shimmer_card.dart';
import 'package:flutter_ui/widgets/appCard/app_note_card.dart';
import 'package:flutter_ui/widgets/appCard/app_note_shimmer_card.dart';
import 'package:flutter_ui/widgets/appCard/app_task_card.dart';
import 'package:flutter_ui/widgets/appCard/app_task_shimmer_card.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

enum CardType { summary, note, task }

@UseCase(name: 'Card', type: Card, path: 'Widget')
Widget appCards(BuildContext context) {
  // Add a knob to select card type
  final cardType = context.knobs.list<CardType>(
    label: 'Card Type',
    options: CardType.values,
    initialOption: CardType.summary,
  );

  // Wrap with MaterialApp and apply theme
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSelectedCard(cardType, context),
          const SizedBox(height: 20),
          _buildSelectedShimmer(cardType),
        ],
      ),
    ),
  );
}

Widget _buildSelectedCard(CardType type, BuildContext context) {
  switch (type) {
    case CardType.summary:
      return SizedBox.square(
        dimension: 90,
        child: AppDailySummaryCard(
          isToday: context.knobs.boolean(label: 'Is Today', initialValue: true),
          amount: context.knobs.int.input(label: 'Amount', initialValue: 20),
          calorieControlled: context.knobs
              .boolean(label: 'Calorie Controlled', initialValue: true),
          sholatCount:
              context.knobs.string(label: 'Sholat Count', initialValue: ''),
          hasCoding:
              context.knobs.boolean(label: 'Has Coding', initialValue: true),
          hasGym: context.knobs.boolean(label: 'Has Gym', initialValue: true),
          hasCardio:
              context.knobs.boolean(label: 'Has Cardio', initialValue: true),
          isSunday:
              context.knobs.boolean(label: 'Is Sunday', initialValue: false),
        ),
      );

    case CardType.note:
      return SizedBox(
        width: 250,
        height: 250,
        child: AppNoteCard(
          noteContent: context.knobs.string(
              label: 'Note Content',
              initialValue: 'This is a dummy note content.'),
          noteId: 'dummy_id',
          noteTitle: context.knobs
              .string(label: 'Note Title', initialValue: 'Dummy Note'),
          onUpdate: (value) {},
          onDelete: (value) {},
        ),
      );

    case CardType.task:
      return SizedBox(
        width: 400,
        height: 75,
        child: AppTaskCard(
          id: 'task_id',
          isDone: context.knobs.boolean(label: 'Is Done', initialValue: false),
          title: context.knobs
              .string(label: 'Task Title', initialValue: 'Task Title'),
          category:
              context.knobs.string(label: 'Category', initialValue: 'Work'),
          time: context.knobs.string(label: 'Time', initialValue: '10:00 AM'),
          date: context.knobs.string(label: 'Date', initialValue: '2023-10-01'),
          leading:
              context.knobs.boolean(label: 'Show Leading', initialValue: true),
          ontap: () {},
          onDelete: () {},
          onUpdateStatus: () {},
        ),
      );
  }
}

Widget _buildSelectedShimmer(CardType type) {
  switch (type) {
    case CardType.summary:
      return const SizedBox.square(
        dimension: 90,
        child: AppDailySummaryShimmerCard(),
      );

    case CardType.note:
      return const SizedBox(
        width: 250,
        height: 250,
        child: AppNoteShimmerCard(),
      );

    case CardType.task:
      return const SizedBox(
        width: 400,
        height: 75,
        child: AppTaskShimmerCard(),
      );
  }
}
