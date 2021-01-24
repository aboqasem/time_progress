import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:time_progress/extensions/responsive_length.dart';

class DateTimePicker extends StatelessWidget {
  final CupertinoDatePickerMode mode;
  final DateTime initialDateTime;
  final void Function(DateTime) onDateTimeChanged;

  DateTimePicker({
    this.mode = CupertinoDatePickerMode.date,
    @required this.initialDateTime,
    @required this.onDateTimeChanged,
  })  : assert(mode != null),
        assert(initialDateTime != null),
        assert(onDateTimeChanged != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.3.vh(context),
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
              color: Colors.white,
              fontSize: min(4.0.vw(context), 30.0),
            ),
          ),
        ),
        child: CupertinoDatePicker(
          mode: mode,
          initialDateTime: initialDateTime,
          onDateTimeChanged: onDateTimeChanged,
        ),
      ),
    );
  }
}
