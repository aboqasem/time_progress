import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final double progress;

  ProgressCard({
    @required this.title,
    @required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(2.0.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontFamily: 'VT323')),
                Text(
                  '${progress.toStringAsFixed(8)}%',
                  style: TextStyle(fontFamily: 'VT323'),
                ),
              ],
            ),
            SizedBox(height: 1.0.h),
            LinearProgressIndicator(value: progress / 100.0),
          ],
        ),
      ),
    );
  }
}
