import 'package:cricket_worlcup_ui/model/PCDashboardModel.dart';
import 'package:cricket_worlcup_ui/screen/PCCricketPlayerListScreen.dart';
import 'package:cricket_worlcup_ui/utils/PCColors.dart';
import 'package:cricket_worlcup_ui/utils/PCDataGenerator.dart';
import 'package:cricket_worlcup_ui/utils/PCStrings.dart';
import 'package:cricket_worlcup_ui/utils/PCWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PCCricketTeamsScreen extends StatefulWidget {
  static String tag = '/CricketTeams';

  @override
  _PCCricketTeamsScreenState createState() => _PCCricketTeamsScreenState();
}

class _PCCricketTeamsScreenState extends State<PCCricketTeamsScreen> {
  late List<PCDashboardModel> mList1;

  @override
  // ignore: must_call_super
  void initState() {
    mList1 = cricketTeamList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cricket_white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, context.width() * 0.22),
        child: headerView(Cricket_lbl_Teams, context),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mList1.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: PCboxDecoration(radius: 10.0),
              padding: EdgeInsets.all(16),
              height: 250,
              child: Stack(

                children: <Widget>[
                  
                  commonCacheImageWidget(mList1[index].icon, 250, fit: BoxFit.cover, width: context.width()).cornerRadiusWithClipRRect(10.0),
                  Container(
                    decoration: PCboxDecoration(radius: 5.0, bgColor: Cricket_white.withOpacity(0.25)),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: context.width(),
                        decoration: boxDecorationWithRoundedCorners(
                           

                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          backgroundColor: Colors.black.withOpacity(0.5),
                        ),
                        child: Text(mList1[index].title, style: boldTextStyle(color: Cricket_white, size: 18)),
                      ),
                    ),
                  )
                ],
              ),
            ).onTap(
              () {
                index != 5 ? PCCricketPlayerListScreen(teamName: mList1[index].title, index: index).launch(context) : SizedBox();
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}
