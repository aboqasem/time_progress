import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_progress/extensions/responsive_length.dart';
import 'package:time_progress/screens/widgets/progress_interval_form.dart';

class AddProgressIntervalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.0.vw(context),
          top: 40.0,
          right: 15.0.vw(context),
          bottom: 40.0 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            Text(
              'Add Progress Interval',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: min(6.0.vw(context), 40.0),
              ),
            ),
            SizedBox(height: 10.0),
            ProgressIntervalForm(),
          ],
        ),
      ),
    );
  }
}
