import 'package:flutter/material.dart';

class TodoCardData {
  final String title;
  final String? time;
  final String? category;
  final String? note;
  final IconData? categoryIcon;
  final bool isDone;

  TodoCardData({
    required this.title,
    required this.isDone,
    this.time,
    this.category,
    this.categoryIcon,
    this.note,
  });
}
