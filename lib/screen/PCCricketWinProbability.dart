import 'dart:convert';
import 'package:cricket_worlcup_ui/function.dart';
import 'package:cricket_worlcup_ui/utils/PCConstant.dart';

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

class PCCricketWinProbability extends StatefulWidget {
  // const PCCricketWinProbability({Key? key}) : super(key: key);

  @override
  State<PCCricketWinProbability> createState() =>
      _PCCricketWinProbabilityState();
  final _formKey = GlobalKey<FormState>();
}

class _PCCricketWinProbabilityState extends State<PCCricketWinProbability> {
  String stadium = '';
  String winner = '';
  String toss_decision = '';
  String team_1 = '';
  String team_2 = '';
  String url = "";

  var data;
  String output = "";
  String input = "";
  String? selectedOption;

  late List<PCDashboardModel> mList1;

  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       

        title: Text('Win Probability'),
        flexibleSpace: Container(

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Color.fromARGB(255, 132, 50, 209),Color.fromARGB(255, 252, 61, 210)]),)),),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40),
                              decoration: BoxDecoration(
                              image: DecorationImage(
                      image: AssetImage("images/enterteam.png"),
                      
                      ),),
                                  height: 45,
                                  width: 300,
                                  
                    
                        ),
            // SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter Ground', hintText: 'ex Mumbai, Chennai...'),
              onChanged: (value) {
                url = "http://10.0.2.2:5000/ipl/win?" + value.toString();
                setState(() {
                  stadium = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Team 1',
                hintText: 'ex Chennai Super Kings',
              ),
              onChanged: (value) {
                url = "http://10.0.2.2:5000/ipl/win?query=" + value.toString();
                setState(() {
                  team_1 = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter Team 2', hintText: 'ex Mumbai Indians'),
              onChanged: (value) {
                url = "http://10.0.2.2:5000/ipl/win?query=" + value.toString();
                setState(() {
                  team_2 = value;
                });
              },
            ),
            SizedBox(height: 16.0),

            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter Toss Winner',
                  hintText: 'b/w  Team1 & Team2'),
              onChanged: (value) {
                url = "http://10.0.2.2:5000/ipl/win?query=" + value.toString();
                setState(() {
                  winner = value;
                });
              },
            ),

            SizedBox(height: 18.0),
            DropdownButtonFormField<String>(
              value: selectedOption,
              onChanged: (newvalue) {
                url =
                    "http://10.0.2.2:5000/ipl/win?query=" + newvalue.toString();
                setState(() {
                  selectedOption = newvalue;
                  toss_decision = selectedOption.toString();
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: 'bat',
                  child: Text('Bat first'),
                ),
                DropdownMenuItem<String>(
                  value: 'field',
                  child: Text('Field first'),
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Bat/Field',
                hintText: 'Toss Winner choice ',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.only(left: 120),
              // height: changeButton ? 0 :20,
              // width: changeButton ? 0 :150,
              child: ElevatedButton(
                onPressed: () async {
                  url =
                      "https://rathoreabhiii.pythonanywhere.com/ipl/win?city=$stadium&";
                  url += "team1=$team_1&";
                  url += "team2=$team_2&";
                  url += "toss_winner=$winner&";
                  url += "toss_decision=$toss_decision";
                  changeButton = true;
                  input = "Might Win Today";

                  data = await (fetchdata(url));
                  // print(data);
                  var decoded = jsonDecode(data);
                  // print(decoded.toString());
                  // print(url);

                  setState(
                    () {
                      output = decoded[0];
                    },
                  );
                },
                child: Text("Check winner"),
                style: TextButton.styleFrom(
                    minimumSize: Size(150, 40),
                    backgroundColor: Color.fromARGB(255, 48, 74, 190)),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 65),
                  height: changeButton ? 250 : 0,
                  width: changeButton ? 250 : 0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/${output}.png"),
                      alignment: Alignment.center,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 35),
                  child: Text(
                    "${output} \n \n ${input}",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
