import 'package:flutter/material.dart';
import 'package:time_progress/screens/widgets/progress_cards_list_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Progress'),
      ),
      body: SafeArea(
        child: ProgressCardListView(),
      ),
    );
  }
}
