import 'package:intl/intl.dart';

String ddMmmYyyy(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date);
}

DateTime ddMmmYyyyToDate(String date) {
  return DateFormat('dd MMM yyyy').parse(date);
}