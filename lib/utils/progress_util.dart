double progress(DateTime begin, DateTime end) {
  if (begin.compareTo(end) > 0) return 100;

  final DateTime now = DateTime.now();

  final int totalSeconds = end.difference(begin).inMilliseconds;
  final int elapsedSeconds = now.difference(begin).inMilliseconds;

  return elapsedSeconds / totalSeconds * 100;
}
