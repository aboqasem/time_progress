import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_progress/extensions/responsive_length.dart';
import 'package:time_progress/models/progress_interval.dart';
import 'package:time_progress/models/progress_intervals.dart';
import 'package:time_progress/screens/widgets/primary_button.dart';
import 'package:time_progress/screens/widgets/progress_interval_date_picker.dart';
import 'package:time_progress/services/storage_service.dart';

class ProgressIntervalForm extends StatefulWidget {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  _ProgressIntervalFormState createState() => _ProgressIntervalFormState();
}

class _ProgressIntervalFormState extends State<ProgressIntervalForm> {
  final ProgressIntervals _intervals = ProgressIntervals.instance;
  final StorageService _storage = StorageService.instance;
  String title;
  DateTime beginDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(minutes: 1));

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ProgressIntervalForm._key,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            textAlign: TextAlign.center,
            cursorColor: Colors.tealAccent,
            keyboardAppearance: Brightness.dark,
            style: TextStyle(fontSize: min(4.0.vw(context), 30.0)),
            onChanged: (String value) => title = value,
            validator: (String value) {
              if (value.isEmpty) return 'Please type in a title.';
              if (_intervals.containsKey(value) ||
                  'YearMonthDayHourMinuteSecond'.contains(value))
                return 'This title already exists.';
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter progress interval title',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 3.0),
              ),
              errorStyle: TextStyle(fontSize: min(3.5.vw(context), 25.0)),
            ),
          ),
          SizedBox(height: 20.0),
          ProgressIntervalDatePicker(
            beginDate: beginDate,
            endDate: endDate,
            onBeginDateChange: (DateTime date) => setState(() {
              beginDate = DateTime(
                date.year,
                date.month,
                date.day,
                beginDate.hour,
                beginDate.minute,
              );
            }),
            onBeginTimeChange: (DateTime time) => setState(() {
              beginDate = DateTime(
                beginDate.year,
                beginDate.month,
                beginDate.day,
                time.hour,
                time.minute,
              );
            }),
            onEndDateChange: (DateTime date) => setState(() {
              endDate = DateTime(
                date.year,
                date.month,
                date.day,
                endDate.hour,
                endDate.minute,
              );
            }),
            onEndTimeChange: (DateTime time) => setState(() {
              endDate = DateTime(
                endDate.year,
                endDate.month,
                endDate.day,
                time.hour,
                time.minute,
              );
            }),
          ),
          SizedBox(height: 40.0),
          PrimaryButton(
            title: 'Add',
            onPressed: () async {
              if (!ProgressIntervalForm._key.currentState.validate()) return;
              final interval = ProgressInterval(
                begin: beginDate,
                end: endDate,
              );
              _intervals[title] = interval;
              await _storage.storeProgressInterval(title, interval);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
