import 'package:flutter/material.dart';
import 'package:time_progress/screens/home_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Progress',
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'VT323'),
        primaryTextTheme:
            ThemeData.dark().primaryTextTheme.apply(fontFamily: 'VT323'),
        accentTextTheme:
            ThemeData.dark().accentTextTheme.apply(fontFamily: 'VT323'),
      ),
      home: HomeScreen(),
    );
  }
}
