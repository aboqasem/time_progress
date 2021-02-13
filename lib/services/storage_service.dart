import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_progress/models/progress_interval.dart';

class StorageService {
  static final StorageService instance = StorageService._();

  StorageService._();

  Future<bool> storeProgressInterval(String key, ProgressInterval value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setStringList(
      key,
      [value.begin.toString(), value.end.toString()],
    );
  }

  Future<bool> storeSnackBarState(bool state) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool('SNACK_BAR', state);
  }

  Future<bool> removeProgressInterval(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }

  Future<Map<String, ProgressInterval>> get progressIntervals async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String> keys = preferences.getKeys().toList();

    final Map<String, ProgressInterval> progressIntervals = {};
    keys.forEach((String key) {
      try {
        final List<String> dates = preferences.getStringList(key);
        progressIntervals[key] = ProgressInterval(
          begin: DateTime.parse(dates[0]),
          end: DateTime.parse(dates[1]),
        );
      } catch (e) {}
    });
    return progressIntervals;
  }

  Future<bool> get snackBarState async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('SNACK_BAR') ?? false;
  }
}
