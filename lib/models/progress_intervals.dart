import 'package:time_progress/models/progress_interval.dart';
import 'package:time_progress/services/storage_service.dart';

class ProgressIntervals {
  static ProgressIntervals instance = ProgressIntervals._();
  final Map<String, ProgressInterval> _intervals = {};
  final StorageService _storage = StorageService.instance;

  ProgressIntervals._() {
    _storage.retrieveProgressIntervals().then((progressIntertvals) {
      addAll(progressIntertvals);
    });
  }

  int get length => _intervals.length;

  ProgressInterval operator [](String key) => _intervals[key];

  void operator []=(String key, ProgressInterval value) =>
      _intervals[key] = value;

  Future<ProgressInterval> remove(String key) async {
    await _storage.removeProgressInterval(key);
    return _intervals.remove(key);
  }

  Iterable<String> get keys => _intervals.keys;

  bool containsKey(String key) => _intervals.containsKey(key);

  void addAll(Map<String, ProgressInterval> other) => _intervals.addAll(other);
}
