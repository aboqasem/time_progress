import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:time_progress/screens/home_screen.dart';
import 'package:time_progress/services/ad_service.dart';
import 'package:time_progress/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAdMob.instance.initialize(appId: AdService.appId);
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
