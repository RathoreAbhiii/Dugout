import 'package:cricket_worlcup_ui/screen/PCSplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: PCSplashScreen(),
      debugShowCheckedModeBanner: false,
      scrollBehavior: SBehavior(),
    );
  }
}
