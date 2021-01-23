import 'dart:math';

import 'package:time_progress/extensions/responsive_length.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;

  ProgressCard({
    @required this.title,
    @required this.description,
    @required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(2.0.vh(context)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title ($description)',
                  style: TextStyle(
                    fontSize: min(4.25.vw(context), 30),
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${progress.toStringAsFixed(8)}%',
                  style: TextStyle(
                    fontSize: min(4.25.vw(context), 30),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.0.vh(context)),
            LinearProgressIndicator(value: progress / 100.0),
          ],
        ),
      ),
    );
  }
}
