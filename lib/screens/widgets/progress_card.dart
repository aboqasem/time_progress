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
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '$title',
                    style: TextStyle(
                      fontSize: min(4.25.vw(context), 30),
                      color: Colors.white,
                    ),
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
            SizedBox(height: 10.0),
            LinearProgressIndicator(value: progress / 100.0),
            SizedBox(height: 10.0),
            Text(
              '$description',
              style: TextStyle(
                fontSize: min(4.0.vw(context), 30),
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
