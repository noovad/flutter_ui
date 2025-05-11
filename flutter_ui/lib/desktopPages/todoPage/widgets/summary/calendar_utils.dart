class CalendarUtils {
  const CalendarUtils._();

  static String getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  static bool isWeekend(int dayOfWeek) {
    // 6 is Saturday, 0 is Sunday in DateTime's weekday
    return dayOfWeek == 6 || dayOfWeek == 0;
  }
}
