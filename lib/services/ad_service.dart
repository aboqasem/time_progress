import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';

class AdService {
  static BannerAd _bannerAd;

  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4235875725893331~7513021721";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4235875725893331~2380755170";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-4235875725893331/2260695042";
    } else if (Platform.isIOS) {
      return "ca-app-pub-4235875725893331/7760433734";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static void loadBannerAd() {
    if (_bannerAd != null) return;
    _bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
    )
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  static void dispose() {
    _bannerAd?.dispose();
  }
}
