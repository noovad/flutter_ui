import 'package:flutter/material.dart';

class TodoCardData {
  final String title;
  final String? time;
  final String? category;
  final IconData? categoryIcon;
  final bool isDone;

  TodoCardData({
    required this.title,
    this.time,
    required this.isDone,
    this.category,
    this.categoryIcon,
  });
}
