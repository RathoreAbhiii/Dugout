import 'dart:convert';
import 'package:cricket_worlcup_ui/function.dart';

import 'package:http/http.dart' as http;
import 'package:cricket_worlcup_ui/model/PCDashboardModel.dart';
// import 'package:cricket_worlcup_ui/screen/PCCricketMatchListScreen.dart';
import 'package:cricket_worlcup_ui/utils/PCColors.dart';
// import 'package:cricket_worlcup_ui/utils/PCDataGenerator.dart';
// import 'package:cricket_worlcup_ui/utils/PCStrings.dart';
// import 'package:cricket_worlcup_ui/utils/PCWidget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:nb_utils/nb_utils.dart';

import '../function.dart';

class PCCricketScorePrediction extends StatefulWidget {
  // const PCCricketWinProbability({Key? key}) : super(key: key);

  @override
  State<PCCricketScorePrediction> createState() =>
      _PCCricketScorePredictionState();
  final _formKey = GlobalKey<FormState>();
}

class _PCCricketScorePredictionState extends State<PCCricketScorePrediction> {
  var current_runs;
  var wickets;
  var overs;
  var runs_last_5;
  var striker_runs;
  var non_striker_runs;
  String url = "";

  var data;
  var output;

  late List<PCDashboardModel> mList1;

  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 252, 61, 210),
          title: Text(
            "Team Score Prediction",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        flexibleSpace: Container(

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Color.fromARGB(255, 132, 50, 209),Color.fromARGB(255, 252, 61, 210)]),)),),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                          margin: EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                              image: DecorationImage(
                      image: AssetImage("images/enterinn.png"),
                      
                      ),),
                                  height: 45,
                                  width: 300,
                                  
                    
                        ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 27.0),
                  child: Column(
                    
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Current runs", labelText: "Enter Runs"),
                        onChanged: (value) {
                          setState(() {
                            current_runs = value;
                          });
                        },
                      ),
                      TextFormField(
                        // so that the password is visible as buttons when typing
                        decoration: InputDecoration(
                            hintText: "Number of fallen wickets",
                            labelText: "Enter Wickets"),
                        onChanged: (value) {
                          setState(() {
                            wickets = value;
                          });
                        },
                      ),
                      TextFormField(
                        // so that the password is visible as buttons when typing
                        decoration: InputDecoration(
                            hintText: "Current Overs completed",
                            labelText: "Enter Overs"),
                        onChanged: (value) {
                          setState(() {
                            overs = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            // hintText: "Runs made in last 5 overs",
                            labelText: "Last 5 Over runs"),
                        onChanged: (value) {
                          setState(() {
                            runs_last_5 = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        // width: 800.0,
                        // margin: EdgeInsets.only(left: 0.0,right: 18.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: ListTile(
                                  title: Text('Striker'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: '  Runs made by Striker',
                                    ),
                                    onChanged: (value) {
                                    setState(() {
                                    striker_runs = value;
                          });
                        },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                              width: 5,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: ListTile(
                                  title: Text('Non Striker'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Runs made by Non-Striker',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        non_striker_runs = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          url = "https://rathoreabhiii.pythonanywhere.com/ipl/score?runs=$current_runs&";
                          url += "wickets=$wickets&";
                          url += "overs=$overs&";
                          url += "runs_last_5=$runs_last_5&";
                          url += "striker=$striker_runs&";
                          url += "non_striker=$non_striker_runs";

                          changeButton = true;
                          data = await (fetchdata(url));
                          var decoded = jsonDecode(data);
                          print(decoded.toString());
                          setState(
                            () {
                              output = decoded[0];
                            },
                          );
                        },
                        child: Text("Calculate Total"),
                        style: TextButton.styleFrom(
                            minimumSize: Size(150, 40),
                            backgroundColor: Color.fromARGB(255, 48, 74, 190)),
                      )
                    ],
                  )),

                   Container(
              height: changeButton ? 400 :0,
              width: changeButton ? 400 :0,
              child: Text(" Predicted Total:  ${output}",style:TextStyle(fontSize: 18.0) ,),
            )
            ],
          ),
        ));
  }
}
