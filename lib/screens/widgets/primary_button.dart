import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_progress/extensions/responsive_length.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  PrimaryButton({@required this.title, @required this.onPressed})
      : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          Colors.tealAccent.withOpacity(0.05),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.tealAccent,
          fontSize: min(5.0.vw(context), 35.0),
        ),
      ),
    );
  }
}
