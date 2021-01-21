double progress(DateTime begin, DateTime end) {
  if (begin.isAfter(end)) return 100;

  final DateTime now = DateTime.now();

  final int totalMilliseconds = end.difference(begin).inMilliseconds;
  final int elapsedMilliseconds = now.difference(begin).inMilliseconds;

  final double progress = elapsedMilliseconds / totalMilliseconds * 100.0;

  return progress <= 100.0 ? progress : 100.0;
}
