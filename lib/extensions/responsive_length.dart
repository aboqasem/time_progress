import 'package:flutter/material.dart';

extension ResponsiveLength on double {
  double vw(BuildContext context) =>
      (MediaQuery.of(context).size.width / 100.0) * this;

  double vh(BuildContext context) =>
      (MediaQuery.of(context).size.height / 100.0) * this;
}
