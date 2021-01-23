import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_progress/screens/widgets/progress_cards_list_view.dart';
import 'package:time_progress/extensions/responsive_length.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time Progress',
          style: TextStyle(fontSize: min(5.0.vw(context), 35.0)),
        ),
      ),
      body: SafeArea(
        child: ProgressCardListView(),
      ),
    );
  }
}
