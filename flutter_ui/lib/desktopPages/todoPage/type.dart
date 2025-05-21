export '../../widgets/appSheet/app_sheet.dart';

class TodoCardData {
  final String? id;
  final String? title;
  final bool? isDone;
  final DateTime? date;
  final String? category;
  final String? time;
  final String? note;

  TodoCardData({
    this.id,
    this.title,
    this.isDone,
    this.date,
    this.category,
    this.time,
    this.note,
  });
}

class TodoData {
  final List<TodoCardData> productivity;
  final List<TodoCardData> daily;

  TodoData({
    required this.productivity,
    required this.daily,
  });
}

class TodoCategories {
  final List<String> productivity;
  final List<String> daily;

  TodoCategories({
    required this.productivity,
    required this.daily,
  });
}

class Note {
  final String? title;
  final String? content;
  final bool isPinned;
  final String? category;
  final String? id;

  Note({
    this.title,
    this.id,
    this.content,
    this.category,
    this.isPinned = false,
  });

  Note copyWith({String? title, String? content, bool? isPinned}) {
    return Note(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
      isPinned: isPinned ?? this.isPinned,
    );
  }
}

class DailyActivity {
  final DateTime date;
  final int sholat;
  final bool gym;
  final bool cardio;
  final bool coding;
  final int amount;
  final bool calorieControlled;

  DailyActivity({
    required this.date,
    required this.sholat,
    required this.gym,
    required this.cardio,
    required this.coding,
    required this.amount,
    required this.calorieControlled,
  });
}
