import 'package:time_progress/constants.dart';

double progress(DateTime begin, DateTime end) {
  if (begin.isAfter(end)) return 100.0;

  final DateTime now = DateTime.now();

  final int totalMilliseconds = end.difference(begin).inMilliseconds;
  final int elapsedMilliseconds = now.difference(begin).inMilliseconds;

  final double progress = elapsedMilliseconds / totalMilliseconds * 100.0;

  return progress <= 100.0 ? progress : 100.0;
}

String description(DateTime begin, DateTime end) {
  return '${kCardDateTimeFormatter.format(begin)} - ${kCardDateTimeFormatter.format(end)}';
}
