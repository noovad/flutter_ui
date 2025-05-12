class TodoCardData {
  final String title;
  final bool isDone;
  final DateTime date;
  final String? category;
  final DateTime? time;
  final String? note;

  TodoCardData({
    required this.title,
    required this.isDone,
    required this.date,
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
  final String title;
  final String content;
  final bool isPinned;
  final String? category;
  final String? id;

  Note({
    required this.title,
    this.id,
    required this.content,
    this.category,
    this.isPinned = false,
  });
}

class DailyActivity {
  final DateTime date;
  final int sholat;
  final bool gym;
  final bool cardio;
  final bool coding;
  final int amount;

  DailyActivity({
    required this.date,
    required this.sholat,
    required this.gym,
    required this.cardio,
    required this.coding,
    required this.amount,
  });
}
