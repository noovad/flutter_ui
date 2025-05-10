import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';

final List<TodoCardData> todoCards = [
  TodoCardData(
    isDone: false,
    title: 'Buy Groceries',
  ),
  TodoCardData(
    isDone: true,
    title: 'Morning Exercise Morning Exercise',
    category: 'Health',
    categoryIcon: Icons.fitness_center,
  ),
  TodoCardData(
    isDone: false,
    title: 'Team Meeting',
    time: '09:00',
    category: 'Work',
    categoryIcon: Icons.work,
  ),
  TodoCardData(
    isDone: false,
    title: 'Doctor Appointment',
    time: '14:00',
    category: 'Health',
    categoryIcon: Icons.local_hospital,
  ),
  TodoCardData(
    isDone: true,
    title: 'Read a Book',
    time: '20:00',
    category: 'Personal',
    categoryIcon: Icons.book,
  ),
  TodoCardData(
    isDone: false,
    title: 'Prepare Presentation',
    time: '16:00',
    category: 'Work',
    categoryIcon: Icons.present_to_all,
  ),
  TodoCardData(
    isDone: true,
    title: 'Call Parents',
    time: '19:00',
    category: 'Personal',
    categoryIcon: Icons.call,
  ),
  TodoCardData(
    isDone: false,
    title: 'Plan Weekend Trip',
    time: '21:00',
    category: 'Leisure',
    categoryIcon: Icons.beach_access,
  ),
];
