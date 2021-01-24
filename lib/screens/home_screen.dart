import 'dart:math';

import 'package:flutter/material.dart';
import 'package:time_progress/screens/widgets/add_progress_interval_sheet.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: min(15.0.vw(context), 90.0),
        height: min(15.0.vw(context), 90.0),
        child: FloatingActionButton(
          child: Icon(Icons.add, size: min(5.0.vw(context), 35.0)),
          onPressed: () async {
            await showModalBottomSheet(
              context: context,
              builder: (_) => AddProgressIntervalSheet(),
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              ),
            );
          },
        ),
      ),
      body: SafeArea(child: ProgressCardListView()),
    );
  }
}
