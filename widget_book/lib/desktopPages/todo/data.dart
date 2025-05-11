import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';

class TodoCategory {
  final String name;
  final IconData icon;

  const TodoCategory(this.name, this.icon);
}

final TodoData todoData = TodoData(productivity: todoCardP, daily: todoDaily);

final List<TodoCardData> todoDaily = List.generate(10, (index) {
  final now = DateTime.now();
  return TodoCardData(
    title: 'Task ${index + 1}',
    isDone: index % 2 == 0,
    date: now.add(Duration(days: index % 3)),
    time: DateTime(now.year, 12, now.day, 6 + index, 0),
    note: index % 2 == 0
        ? 'Note for task Note for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for task ${index + 1}'
        : null,
  );
});

final List<TodoCardData> todoHistory = List.generate(10, (index) {
  final now = DateTime.now();
  return TodoCardData(
    title: 'Task ${index + 1}',
    isDone: index % 2 == 0,
    date: now.add(Duration(days: index % 3)).copyWith(month: 11),
    time: DateTime(now.year, now.month, now.day, 6 + index, 0),
    note: index % 2 == 0
        ? 'Note for task Note for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for taskNote for task ${index + 1}'
        : null,
  );
});

final List<TodoCardData> todoCardP = List.generate(10, (index) {
  final now = DateTime.now();
  return TodoCardData(
    title: 'Project Task ${index + 1}',
    isDone: index % 2 == 0,
    date: now.add(Duration(days: index + 1)),
    category: ['Work', 'Personal', 'Finance', 'Home'][index % 4],
    time: DateTime(now.year, now.month, now.day + index, 9 + index, 0),
    note: index % 3 == 0 ? 'Details for project task ${index + 1}' : null,
  );
});

final List<Note> sampleNotes = List.generate(10, (index) {
  return Note(
    title: 'Note ${index + 1}',
    content: 'Content for note ${index + 1}',
    category: [
      'Personal',
      'Work',
      'Health',
      'Travel',
      'Cooking',
      'Finance'
    ][index % 6],
    isPinned: index % 2 == 0,
  );
});

final TodoCategories todoCategories = TodoCategories(
  productivity: ['None', 'Work', 'Personal', 'Finance', 'Home'],
  daily: ['None', 'Health', 'Routine', 'Leisure'],
);

final List<String> noteCategories = [
  'None',
  'Personal',
  'Work',
  'Health',
  'Travel',
  'Cooking',
  'Finance',
];

final List<DailyActivity> dailyActivities = List.generate(31, (index) {
  final date = DateTime(DateTime.now().year, 5, index + 1);
  return DailyActivity(
    date: date,
    sholat: (index % 6), // Randomized between 0 to 5
    gym: index % 2 == 0, // Alternating days
    cardio: index % 3 == 0, // Every third day
    coding: index % 2 != 0, // Alternating days
    amount: (index + 1) * 100, // Incremental amount
  );
});
