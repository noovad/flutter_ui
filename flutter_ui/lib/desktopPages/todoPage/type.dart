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

class Note {
  final String title;
  final String content;
  final String? category;
  final bool isPinned;

  Note({
    required this.title,
    required this.content,
    this.category,
    this.isPinned = false,
  });
}
