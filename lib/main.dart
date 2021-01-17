import 'package:flutter/material.dart';
import 'package:time_progress/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Progress',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
