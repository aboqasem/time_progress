import 'package:time_progress/models/progress_interval.dart';

class ProgressIntervals {
  static ProgressIntervals _progressIntervals;
  final Map<String, ProgressInterval> _intervals = {};

  ProgressIntervals._();

  factory ProgressIntervals() {
    if (_progressIntervals == null) _progressIntervals = ProgressIntervals._();
    return _progressIntervals;
  }

  int get length => _intervals.length;

  ProgressInterval operator [](String key) => _intervals[key];

  void operator []=(String key, ProgressInterval value) =>
      _intervals[key] = value;

  ProgressInterval remove(String key) => _intervals.remove(key);

  Iterable<String> get keys => _intervals.keys;

  bool containsKey(String key) => _intervals.containsKey(key);

  void addAll(Map<String, ProgressInterval> other) => _intervals.addAll(other);
}
