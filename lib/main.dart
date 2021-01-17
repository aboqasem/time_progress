import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:time_progress/screens/home_screen.dart';
import 'package:time_progress/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Time Progress',
              theme: themeData,
              home: HomeScreen(),
            );
          },
        );
      },
    );
  }
}
