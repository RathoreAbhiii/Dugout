import 'dart:convert';

import 'package:cricket_worlcup_ui/model/PCScheduleData.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketMatchDetailScreen.dart';
import 'package:cricket_worlcup_ui/utils/PCColors.dart';
import 'package:cricket_worlcup_ui/utils/PCConstant.dart';
import 'package:cricket_worlcup_ui/utils/PCImages.dart';
import 'package:cricket_worlcup_ui/utils/PCStrings.dart';
import 'package:cricket_worlcup_ui/utils/PCWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class PCCricketScheduleScreen extends StatefulWidget {
  static String tag = '/CricketSchedule';

  @override
  _PCCricketScheduleScreenState createState() => _PCCricketScheduleScreenState();
}

class _PCCricketScheduleScreenState extends State<PCCricketScheduleScreen> {
  String strSplit = "";

  PCScheduleData? model;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    String json = await rootBundle.loadString('assets/schedule.json');

    model = PCScheduleData.fromJson(jsonDecode(json));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_app_Background,
      appBar: PreferredSize(
        preferredSize: Size(context.width(), 100),
        child: headerView(Cricket_lbl_Schedules, context),
      ),
      body: model != null
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: model!.schedule!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      Schedule schedule = model!.schedule![index];

                      return Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  width: context.width(),
                                  height: 50,
                                  child: Row(
                                    children: <Widget>[
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Stack(
                                            alignment: Alignment.centerRight,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Container(height: 25, width: (context.width() - 16) / 2, color: getColorFromHex(getDarkColor(schedule.team1Key))),
                                                  Container(height: 25, width: (context.width() - 16) / 2, color: getColorFromHex(getLightColor(schedule.team1Key))),
                                                ],
                                              ),
                                              if (getBgFlag(schedule.team1Key).isNotEmpty) commonCacheImageWidget(getBgFlag(schedule.team1Key), context.width() * 0.1),
                                              // text
                                            ],
                                          ),
                                          Text(schedule.team1Key!.toUpperCase(), style: primaryTextStyle(color: Cricket_white, fontFamily: fontMedium)),
                                        ],
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Container(height: 25, width: (context.width() - 16) / 2, color: getColorFromHex(getDarkColor(schedule.team2Key))),
                                                  Container(height: 25, width: (context.width() - 16) / 2, color: getColorFromHex(getLightColor(schedule.team2Key))),
                                                ],
                                              ),
                                              if (getBgFlag(schedule.team2Key).isNotEmpty) commonCacheImageWidget(getBgFlag(schedule.team2Key), context.width() * 0.1),
                                              // text
                                            ],
                                          ),
                                          Text(schedule.team2Key!.toUpperCase(), style: primaryTextStyle(color: Cricket_white, fontFamily: fontMedium)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ).cornerRadiusWithClipRRect(10.0).paddingOnly(left: 8, right: 8, top: 16),
                                commonCacheImageWidget(Cricket_ic_ball_white, 65, width: 65).center()
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                              width: context.width(),
                              decoration: BoxDecoration(
                                color: Cricket_white,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(schedule.vnu!, style: primaryTextStyle(color: Cricket_textColorPrimary, size: 18, fontFamily: fontMedium)),
                                  10.height,
                                  Text(schedule.result!, style: primaryTextStyle(color: Cricket_Primary, size: 18, fontFamily: fontMedium))
                                ],
                              ),
                            )
                          ],
                        ).onTap(
                          () {
                            PCCricketMatchDetailScreen(team1: model!.schedule![index].team1Key!.toUpperCase(), team2: model!.schedule![index].team2Key!.toUpperCase()).launch(context);
                          },
                        ),
                      );
                    },
                  ),
                  10.height,
                ],
              ),
            )
          : Loader(),
    );
  }
}
