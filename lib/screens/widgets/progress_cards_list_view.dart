import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_progress/constants.dart';
import 'package:time_progress/models/progress_intervals.dart';
import 'package:time_progress/screens/widgets/progress_card.dart';
import 'package:time_progress/utils/progress_util.dart';

class ProgressCardListView extends StatefulWidget {
  @override
  _ProgressCardListViewState createState() => _ProgressCardListViewState();
}

class _ProgressCardListViewState extends State<ProgressCardListView> {
  final ProgressIntervals _intervals = ProgressIntervals();
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 1), (Timer timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<String> titles = _intervals.keys;
    final DateTime now = DateTime.now();

    final DateTime beginYear = DateTime(now.year);
    final DateTime endYear = DateTime(now.year + 1);

    final DateTime beginMonth = DateTime(now.year, now.month);
    final DateTime endMonth = DateTime(now.year, now.month + 1);

    final DateTime beginDay = DateTime(now.year, now.month, now.day);
    final DateTime endDay = DateTime(now.year, now.month, now.day + 1);

    final DateTime beginHour = DateTime(now.year, now.month, now.day, now.hour);
    final DateTime endHour =
        DateTime(now.year, now.month, now.day, now.hour + 1);

    final DateTime beginMinute =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);
    final DateTime endMinute =
        DateTime(now.year, now.month, now.day, now.hour, now.minute + 1);

    final DateTime beginSecond = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    final DateTime endSecond = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second + 1);

    return ListView(
      children: [
        ProgressCard(
          title: 'Year',
          description: '${beginYear.year} - ${endYear.year}',
          progress: progress(beginYear, endYear),
        ),
        ProgressCard(
          title: 'Month',
          description: '${beginMonth.month} - ${endMonth.month}',
          progress: progress(beginMonth, endMonth),
        ),
        ProgressCard(
          title: 'Day',
          description: '${beginDay.day} - ${endDay.day}',
          progress: progress(beginDay, endDay),
        ),
        ProgressCard(
          title: 'Hour',
          description: '${beginHour.hour} - ${endHour.hour}',
          progress: progress(beginHour, endHour),
        ),
        ProgressCard(
          title: 'Minute',
          description: '${beginMinute.minute} - ${endMinute.minute}',
          progress: progress(beginMinute, endMinute),
        ),
        ProgressCard(
          title: 'Second',
          description: '${beginSecond.second} - ${endSecond.second}',
          progress: progress(beginSecond, endSecond),
        ),
        ...List<ProgressCard>.generate(
          _intervals.length,
          (int i) {
            final String title = titles.elementAt(i);
            return ProgressCard(
              title: title,
              description:
                  '${kCardDateTimeFormat.format(_intervals[title].begin)} - ${kCardDateTimeFormat.format(_intervals[title].end)}',
              progress: progress(
                _intervals[title].begin,
                _intervals[title].end,
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
