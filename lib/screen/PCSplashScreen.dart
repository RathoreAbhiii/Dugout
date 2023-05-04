import 'dart:async';

import 'package:cricket_worlcup_ui/screen/PCDashBoardScreen.dart';
import 'package:cricket_worlcup_ui/utils/PCColors.dart';
import 'package:cricket_worlcup_ui/utils/PCImages.dart';
import 'package:cricket_worlcup_ui/utils/PCWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PCSplashScreen extends StatefulWidget {
  static String tag = '/CricketSplashScreen';

  @override
  _PCSplashScreenState createState() => _PCSplashScreenState();
}

class _PCSplashScreenState extends State<PCSplashScreen> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    finish(context);
    PCDashBoardScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Cricket_white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              commonCacheImageWidget(Cricket_Logo, width * 0.35, width: width * 0.35, fit: BoxFit.fill),
            ],
          ),
        ),
      ),
    );
  }
}
