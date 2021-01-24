import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_progress/constants.dart';
import 'package:time_progress/extensions/responsive_length.dart';
import 'package:time_progress/screens/widgets/date_time_picker.dart';
import 'package:time_progress/screens/widgets/primary_button.dart';

class ProgressIntervalDatePicker extends StatelessWidget {
  final DateTime beginDate;
  final DateTime endDate;
  final void Function(DateTime) onBeginDateChange;
  final void Function(DateTime) onBeginTimeChange;
  final void Function(DateTime) onEndDateChange;
  final void Function(DateTime) onEndTimeChange;

  ProgressIntervalDatePicker({
    @required this.beginDate,
    @required this.endDate,
    @required this.onBeginDateChange,
    @required this.onBeginTimeChange,
    @required this.onEndDateChange,
    @required this.onEndTimeChange,
  })  : assert(beginDate != null),
        assert(endDate != null),
        assert(onBeginDateChange != null),
        assert(onBeginTimeChange != null),
        assert(onEndDateChange != null),
        assert(onEndTimeChange != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From:',
              style: TextStyle(fontSize: min(5.0.vw(context), 35.0)),
            ),
            SizedBox(width: min(2.0.vw(context), 10.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PrimaryButton(
                  title: kFormDateFormatter.format(beginDate),
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => DateTimePicker(
                        initialDateTime: beginDate,
                        onDateTimeChanged: onBeginDateChange,
                      ),
                    );
                  },
                ),
                PrimaryButton(
                  title: kFormTimeFormatter.format(beginDate),
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => DateTimePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: beginDate,
                        onDateTimeChanged: onBeginTimeChange,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To:',
              style: TextStyle(fontSize: min(5.0.vw(context), 35.0)),
            ),
            SizedBox(width: min(2.0.vw(context), 10.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PrimaryButton(
                  title: kFormDateFormatter.format(endDate),
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => DateTimePicker(
                        initialDateTime: endDate,
                        onDateTimeChanged: onEndDateChange,
                      ),
                    );
                  },
                ),
                PrimaryButton(
                  title: kFormTimeFormatter.format(endDate),
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => DateTimePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: endDate,
                        onDateTimeChanged: onEndTimeChange,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
