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
    try {
      AdService.loadBannerAd();
    } catch (e) {
      print('Ads not supported.');
    }
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
    try {
      AdService.dispose();
    } catch (e) {
      print('Ads not supported.');
    }
    super.dispose();
  }
}
