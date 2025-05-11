import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';

class TodoCategory {
  final String name;
  final IconData icon;

  const TodoCategory(this.name, this.icon);
}

final TodoData todoData = TodoData(productivity: todoCardP, daily: todoDaily);

final List<TodoCardData> todoDaily = [
  TodoCardData(
    title: 'Morning Exercise',
    isDone: false,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 0),
    note: '30 minutes of jogging and stretching',
  ),
  TodoCardData(
    title: 'Team Standup',
    isDone: false,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 30),
    note: 'Discuss sprint progress',
  ),
  TodoCardData(
    title: 'Check Emails',
    isDone: false,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
  ),
  TodoCardData(
    title: 'Lunch Break',
    isDone: false,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 30),
  ),
  TodoCardData(
    title: 'Review Pull Requests',
    isDone: false,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0),
  ),
  TodoCardData(
    title: 'Water Plants',
    isDone: false,
    date: DateTime.now().add(Duration(days: 1)),
  ),
  TodoCardData(
    title: 'Take Vitamins',
    isDone: false,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0),
    note: 'With breakfast',
  ),
  TodoCardData(
    title: 'Check Budget',
    isDone: false,
    date: DateTime.now().add(Duration(days: 2)),
  ),
  TodoCardData(
    title: 'Evening Walk',
    isDone: false,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 30),
    note: '20 minutes around the park',
  ),
  TodoCardData(
    title: 'Meditate',
    isDone: false,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 22, 0),
    note: '10 minutes before sleep',
  ),
  TodoCardData(
    title: 'Breakfast',
    isDone: true,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 30),
    note: 'Oatmeal and fruits',
  ),
  TodoCardData(
    title: 'Take Medication',
    isDone: true,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0),
  ),
  TodoCardData(
    title: 'Check News',
    isDone: true,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 30),
  ),
  TodoCardData(
    title: 'Coffee Break',
    isDone: true,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 45),
  ),
  TodoCardData(
    title: 'Check Social Media',
    isDone: true,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
    note: 'Limit to 15 minutes',
  ),
  TodoCardData(
    title: 'Charge Phone',
    isDone: true,
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  TodoCardData(
    title: 'Fill Water Bottle',
    isDone: true,
    date: DateTime.now(),
  ),
  TodoCardData(
    title: 'Clean Glasses',
    isDone: true,
    date: DateTime.now(),
  ),
  TodoCardData(
    title: 'Check Calendar',
    isDone: true,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0),
    note: 'Review upcoming meetings',
  ),
  TodoCardData(
    title: 'Set Alarm',
    isDone: true,
    date: DateTime.now(),
    time: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 22, 30),
  ),
];

final List<TodoCardData> todoCardP = [
  TodoCardData(
    title: 'Complete Project Proposal',
    isDone: false,
    date: DateTime.now().add(Duration(days: 3)),
    category: 'Work',
    time: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 3, 17, 0),
    note: 'Include budget estimates and timeline',
  ),
  TodoCardData(
    title: 'Research New Framework',
    isDone: false,
    category: 'Work',
    date: DateTime.now().add(Duration(days: 5)),
    note: 'Compare React vs Vue performance',
  ),
  TodoCardData(
    title: 'Update Portfolio Website',
    isDone: false,
    category: 'Personal',
    date: DateTime.now().add(Duration(days: 7)),
  ),
  TodoCardData(
    title: 'Learn Flutter Animation',
    isDone: false,
    category: 'Personal',
    date: DateTime.now().add(Duration(days: 2)),
    note: 'Complete tutorial series',
  ),
  TodoCardData(
    title: 'Quarterly Tax Planning',
    isDone: false,
    category: 'Finance',
    date: DateTime.now().add(Duration(days: 10)),
  ),
  TodoCardData(
    title: 'Plan Family Vacation',
    isDone: false,
    category: 'Personal',
    note: 'Research destinations and accommodations',
    date: DateTime.now().add(Duration(days: 8)),
  ),
  TodoCardData(
    title: 'Home Office Reorganization',
    isDone: false,
    category: 'Home',
    date: DateTime.now().add(Duration(days: 4)),
  ),
  TodoCardData(
    title: 'Prepare Workshop Materials',
    isDone: false,
    category: 'Work',
    date: DateTime.now().add(Duration(days: 6)),
    note: 'Create slide deck and exercises',
  ),
  TodoCardData(
    title: 'Review Investment Portfolio',
    isDone: false,
    category: 'Finance',
    date: DateTime.now().add(Duration(days: 8)),
  ),
  TodoCardData(
    title: 'Build Side Project MVP',
    isDone: false,
    category: 'Personal',
    note: 'Focus on core functionality only',
    date: DateTime.now().add(Duration(days: 8)),
  ),
  TodoCardData(
    title: 'Update Resume',
    isDone: true,
    category: 'Personal',
    date: DateTime.now().subtract(Duration(days: 5)),
  ),
  TodoCardData(
    title: 'Weekly Team Report',
    isDone: true,
    category: 'Work',
    date: DateTime.now().subtract(Duration(days: 3)),
    note: 'Include sprint metrics',
  ),
  TodoCardData(
    title: 'Organize Digital Files',
    isDone: true,
    category: 'Personal',
    date: DateTime.now().subtract(Duration(days: 7)),
  ),
  TodoCardData(
    title: 'Read Technical Article',
    isDone: true,
    category: 'Work',
    date: DateTime.now().subtract(Duration(days: 2)),
    note: 'About microservices architecture',
  ),
  TodoCardData(
    title: 'Pay Monthly Bills',
    isDone: true,
    category: 'Finance',
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  TodoCardData(
    title: 'Backup Computer',
    isDone: true,
    category: 'Personal',
    date: DateTime.now().subtract(Duration(days: 10)),
  ),
  TodoCardData(
    title: 'Update Software Dependencies',
    isDone: true,
    category: 'Work',
    date: DateTime.now().subtract(Duration(days: 4)),
  ),
  TodoCardData(
    title: 'Review Monthly Budget',
    isDone: true,
    category: 'Finance',
    date: DateTime.now().subtract(Duration(days: 6)),
    note: 'Identify areas to optimize spending',
  ),
  TodoCardData(
    title: 'Clean Email Inbox',
    isDone: true,
    category: 'Work',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  TodoCardData(
    title: 'Set Quarterly Goals',
    isDone: true,
    category: 'Personal',
    date: DateTime.now().subtract(Duration(days: 15)),
    note: 'Focus on career, health, and personal growth',
  ),
];
final List<Note> sampleNotes = [
  Note(
    title: 'Grocery List dan dan dan dan dan dan',
    content:
        'Milk, Eggs, Bread, Butter, CheeseMilk, Eggs, Bread, Butter, CheeseMilk, Eggs, Bread, Butter, CheeseMilk, Eggs, Bread, Butter, CheeseMilk, Eggs, Bread, Butter, Cheese',
    // category: 'Personal',
    isPinned: true,
  ),
  Note(
    title: 'Meeting Notes',
    content: 'Discuss project milestones and deadlines.',
    category: 'Work',
  ),
  Note(
    title: 'Book Recommendations',
    content: 'Atomic Habits, Clean Code, The Pragmatic Programmer',
    category: 'Personal',
  ),
  Note(
    title: 'Workout Plan',
    content: 'Monday: Cardio, Wednesday: Strength, Friday: Yoga',
    category: 'Health',
    isPinned: true,
  ),
  Note(
    title: 'Vacation Ideas',
    content: 'Visit Bali, explore local beaches, and try snorkeling.',
    category: 'Travel',
  ),
  Note(
    title: 'Weekly Goals',
    content: 'Complete project tasks, exercise 3 times, read 2 chapters.',
    category: 'Personal',
  ),
  Note(
    title: 'Recipe Ideas',
    content: 'Pasta Carbonara, Chicken Curry, Veggie Stir-fry',
    category: 'Cooking',
  ),
  Note(
    title: 'Budget Plan',
    content:
        'Allocate 20% for savings, 30% for essentials, 50% for other expenses.',
    category: 'Finance',
  ),
  Note(
    title: 'Learning Topics',
    content: 'Flutter animations, Dart streams, State management',
    category: 'Work',
  ),
  Note(
    title: 'Gift Ideas',
    content: 'Books, Gadgets, Personalized items',
    category: 'Personal',
  ),
];
