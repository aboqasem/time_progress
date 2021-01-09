import 'package:flutter/material.dart';
import 'package:time_progress/screens/widgets/progress_cards_list_view.dart';
import 'package:time_progress/services/ad_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AdService.loadBannerAd();
  }

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

  @override
  void dispose() {
    AdService.dispose();
    super.dispose();
  }
}
