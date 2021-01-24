import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_progress/models/progress_interval.dart';

class StorageService {
  static final StorageService instance = StorageService._();

  StorageService._();

  Future<bool> storeProgressInterval(String key, ProgressInterval value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setStringList(
      key,
      [value.begin.toString(), value.end.toString()],
    );
  }

  Future<bool> removeProgressInterval(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(key);
  }

  Future<Map<String, ProgressInterval>> retrieveProgressIntervals() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String> keys = preferences.getKeys().toList();

    final Map<String, ProgressInterval> progressIntervals = {};
    keys.forEach((String key) {
      final List<String> dates = preferences.getStringList(key);
      progressIntervals[key] = ProgressInterval(
        begin: DateTime.parse(dates[0]),
        end: DateTime.parse(dates[1]),
      );
    });
    return progressIntervals;
  }
}
