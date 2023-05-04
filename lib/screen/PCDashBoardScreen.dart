import 'dart:convert';

import 'package:cricket_worlcup_ui/model/PCDashboardModel.dart';
import 'package:cricket_worlcup_ui/model/PCLiveMatchesData.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketFeedbackScreen.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketHistoryScreen.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketWinProbability.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketScorePrediction.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketMatchDetailScreen.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketMatchInPreviewScreen.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketPlayerScorePrediction.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketPointTableScreen.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketRankingScreen.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketScheduleScreen.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketTeamsScreen.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketVenueScreen.dart';
import 'package:cricket_worlcup_ui/utils/PCColors.dart';
import 'package:cricket_worlcup_ui/utils/PCDataGenerator.dart';
import 'package:cricket_worlcup_ui/utils/PCImages.dart';
import 'package:cricket_worlcup_ui/utils/PCStrings.dart';
import 'package:cricket_worlcup_ui/utils/PCWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:cricket_worlcup_ui/function.dart';

class PCDashBoardScreen extends StatefulWidget {
  static String tag = '/CricketDashBoard';

  @override
  _PCDashBoardScreenState createState() => _PCDashBoardScreenState();
}

class _PCDashBoardScreenState extends State<PCDashBoardScreen> {
  String url = "";
  var data;
  String output = 'Initial Output';

  late List<PCLiveMatchesModel> mList1;
  late List<PCDashboardModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = CricketLiveMatchesList();
    mList2 = CricketDashboardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_Primary, // Entire Page Color
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            40.height,
            Text(Cricket_lbl_Matches,
                    style: boldTextStyle(
                        color: white, size: 30, fontFamily: 'Poppins'))
                .paddingAll(16), // Matches
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList1.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      PCCricketMatchDetailScreen(
                              team1: mList1[index].team1,
                              team2: mList1[index].team2)
                          .launch(context);
                    } else {
                      PCCricketMatchInPreviewScreen(
                              team1: mList1[index].team1,
                              team2: mList1[index].team2)
                          .launch(context);
                    }
                    setState(() {});
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        // ScoreBox
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                              Cricket_Gradient_color2.withOpacity(0.99999999),
                              Cricket_Gradient_color1
                            ])),
                        width: 375,
                        child: Column(
                          children: <Widget>[
                            10.height,
                            Text(mList1[index].title,
                                    style: secondaryTextStyle(
                                        size: 14,
                                        color: white,
                                        fontFamily: 'Poppins'))
                                .paddingOnly(
                                    top: 24.0, left: 16.0, bottom: 8.0),
                            Text(mList1[index].place,
                                    style: boldTextStyle(
                                        color: white,
                                        size: 18,
                                        fontFamily: 'Poppins'))
                                .paddingOnly(left: 16.0, bottom: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 58,
                                      height: 58,
                                      decoration: BoxDecoration(
                                          color: Cricket_white,
                                          shape: BoxShape.circle),
                                      child: commonCacheImageWidget(
                                              Cricket_Logo, 10,
                                              width: 10, fit: BoxFit.fill)
                                          .paddingAll(16.0),
                                    ).paddingOnly(left: 16.0),
                                    Text(mList1[index].team1,
                                            style: primaryTextStyle(
                                                color: white,
                                                size: 16,
                                                fontFamily: 'Poppins'))
                                        .paddingOnly(
                                            left: 8.0, right: 16.0) //ENG
                                  ],
                                ).expand(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 58,
                                      height: 58,
                                      decoration: BoxDecoration(
                                          color: Cricket_white,
                                          shape: BoxShape.circle),
                                      child: commonCacheImageWidget(
                                              Cricket_Logo, 10,
                                              width: 10, fit: BoxFit.fill)
                                          .paddingAll(16.0),
                                    ).paddingOnly(left: 16.0),
                                    Text(mList1[index].team2,
                                            style: primaryTextStyle(
                                                color: white,
                                                size: 16,
                                                fontFamily: 'Poppins'))
                                        .paddingOnly(
                                            left: 8.0, right: 16.0) //AUS
                                  ],
                                ).expand(flex: 1)
                              ],
                            ),
                            Text(mList1[index].won,
                                    style: boldTextStyle(
                                        size: 18,
                                        color: white,
                                        fontFamily: "Poppins"))
                                .paddingOnly(
                                    top: 16.0, left: 16.0, bottom: 16.0),
                          ],
                        ),
                      )
                          .cornerRadiusWithClipRRect(10.0)
                          .paddingOnly(left: 16.0, top: 16.0),
                      Container(
                        width: context.width() * .9,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              decoration: PCboxDecoration(
                                  radius: 6.0,
                                  bgColor: Color.fromARGB(255, 255, 255, 255)),
                              child: Text(mList1[index].type,
                                      style: primaryTextStyle(
                                          color: black,
                                          size: 16,
                                          fontFamily: "Poppins"))
                                  .paddingOnly(left: 8.0, right: 8.0),
                            ).paddingOnly(top: 8.0, left: 24.0),
                            Container(
                              margin: EdgeInsets.only(right: 8.0),
                              height: mList1[index].live == true ? 25 : 0,
                              decoration: PCboxDecoration(
                                  radius: 6.0, bgColor: Cricket_white),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                          width: 8,
                                          height: 8,
                                          decoration: PCboxDecoration(
                                              radius: 5.0,
                                              bgColor: Colors.green))
                                      .center()
                                      .paddingOnly(left: 8.0),
                                  Text("Live Match",
                                          style: primaryTextStyle(
                                              size: 14,
                                              color: black,
                                              fontFamily: "Poppins"))
                                      .paddingOnly(left: 8.0, right: 8.0),
                                ],
                              ),
                            ).paddingOnly(top: 8.0, left: 24.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            16.height, // LIST OF TABS
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList2.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  print(index);
                  if (index == 0)
                    PCCricketScheduleScreen().launch(context);
                  else if (index == 1)
                    PCCricketTeamsScreen().launch(context);
                  else if (index == 2)
                    PCCricketVenueScreen().launch(context);
                  else if (index == 3)
                    PCCricketPointTableScreen().launch(context);
                  else if (index == 4)
                    PCCricketRankingScreen().launch(context);
                  else if (index == 5)
                    PCCricketHistoryScreen().launch(context);
                  else if (index == 6)
                    PCCricketWinProbability().launch(context);
                  else if (index == 7)
                    PCCricketScorePrediction().launch(context);
                  else if (index == 8)
                    PCCricketPlayerScorePrediction().launch(context);
                  else if (index == 9)
                    PCCricketFeedbackScreen().launch(context);
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10), // List items
                  decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: Cricket_color1.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(mList2[index].icon,
                                  height: 30, width: 30, color: white)
                              .paddingOnly(left: 8.0, top: 8.0, bottom: 8.0),
                          16.width,
                          Text(mList2[index].title,
                                  style: primaryTextStyle(
                                      size: 18,
                                      color: white,
                                      fontFamily: 'Poppins'))
                              .paddingOnly(left: 8.0),
                        ],
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        // decoration: boxDecorationWithRoundedCorners(backgroundColor: Cricket_SkyBlue_Color, borderRadius: BorderRadius.circular(30)),
                        child: Image.asset(Cricket_ic_ArrowRight,
                                color: white, height: 105, width: 105)
                            .paddingAll(4.0),
                      ).paddingOnly(right: 8.0)
                    ],
                  ),
                ).cornerRadiusWithClipRRect(10.0).paddingAll(8.0),
              ),
            ).paddingOnly(left: 8.0, right: 8.0, bottom: 8.0),
          ],
        ),
      ),
    );
  }
}
