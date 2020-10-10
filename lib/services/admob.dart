import 'dart:io';
import 'package:flutter/material.dart';

class AdMobService {
  String getBannerAdUnitId() {
    if (Platform.isAndroid) {
      // テスト用
      return 'ca-app-pub-3940256099942544/6300978111';
      // return 'ca-app-pub-1667936047040887/1282958246';
    } else if (Platform.isIOS) {
      // テスト用
      return 'ca-app-pub-3940256099942544/2934735716';
      // return 'ca-app-pub-1667936047040887/2813863466';
    }
    return null;
  }

  double getHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final percent = (height * 0.06).toDouble();

    return percent;
  }
}
