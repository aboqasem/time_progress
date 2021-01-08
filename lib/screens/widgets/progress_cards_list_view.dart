import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_progress/screens/widgets/progress_card.dart';
import 'package:time_progress/utils/progress_util.dart';

class ProgressCardListView extends StatefulWidget {
  @override
  _ProgressCardListViewState createState() => _ProgressCardListViewState();
}

class _ProgressCardListViewState extends State<ProgressCardListView> {
  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    final DateTime beginYear = DateTime(now.year);
    final DateTime endYear = DateTime(now.year + 1);

    final DateTime beginMonth = DateTime(now.year, now.month);
    final DateTime endMonth = DateTime(now.year, now.month + 1);

    final DateTime beginDay = DateTime(now.year, now.month, now.day);
    final DateTime endDay = DateTime(now.year, now.month, now.day + 1);

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
          progress: progress(beginYear, endYear),
        ),
        ProgressCard(
          title: 'Month',
          progress: progress(beginMonth, endMonth),
        ),
        ProgressCard(
          title: 'Day',
          progress: progress(beginDay, endDay),
        ),
        ProgressCard(
          title: 'Minute',
          progress: progress(beginMinute, endMinute),
        ),
        ProgressCard(
          title: 'Second',
          progress: progress(beginSecond, endSecond),
        ),
      ],
    );
  }
}
