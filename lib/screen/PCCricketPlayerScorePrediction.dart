import 'dart:convert';
import 'package:cricket_worlcup_ui/function.dart';
import 'package:cricket_worlcup_ui/utils/PCConstant.dart';
import 'package:http/http.dart' as http;
import 'package:cricket_worlcup_ui/model/PCDashboardModel.dart';
import 'package:cricket_worlcup_ui/utils/PCColors.dart';
import 'package:flutter/material.dart';

class PCCricketPlayerScorePrediction extends StatefulWidget {
  // const PCCricketPlayerScorePrediction({Key? key}) : super(key: key);

  @override
  State<PCCricketPlayerScorePrediction> createState() =>
      _PCCricketPlayerScorePrediction();
  final _formKey = GlobalKey<FormState>();
}

class _PCCricketPlayerScorePrediction
    extends State<PCCricketPlayerScorePrediction> {
// player details
  String player_name = '';
  String opposition_name = '';
  String ground = '';
  String country = '';
  String url = "";

  var data;
  String output = "";
//  Stats
  var no_of_innings;
  var average;
  var strike_rate;
  var highest_score;
  var zeros;
  var fifties;
  var centuries;

  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 252, 61, 210),
          title: Text(
            "Player Score Prediction",
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
          colors: <Color>[Color.fromARGB(255, 132, 50, 209),Color.fromARGB(255, 252, 61, 210)]),
          )
          ),
          ),

        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 22.0),
                  child: Column(
                    children: [
                      Container(
                              decoration: BoxDecoration(
                              image: DecorationImage(
                      image: AssetImage("images/enterdetails.png"),
                      
                      ),),
                                  height: 45,
                                  width: 300,
                                  
                    
                        ),
                      Container(
                        width: 340.0 ,
                        child: TextFormField(
                          decoration: InputDecoration(
                            
                              hintText: "ex Mahendra Singh Dhoni", labelText: "Enter Player Name"),
                          onChanged: (value) {
                            setState(() {
                              player_name = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 340.0,
                        child: TextFormField(
                          // so that the password is visible as buttons when typing
                          decoration: InputDecoration(
                              hintText: "Name of opponent team",
                              labelText: "Enter Opposition"),
                          onChanged: (value) {
                            setState(() {
                              opposition_name = value;
                            });
                          },
                        ),
                      ),
      
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: 800.0,
                        margin: EdgeInsets.only(left: 0.0,right: 18.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: ListTile(
                                  title: Text('Ground'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Stadium Name',
                                    ),
                                    onChanged: (value) {
                                    setState(() {
                                    ground = value;
                                    });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: ListTile(
                                  title: Text('Country'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'ex. India',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        country = value;
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
                          // child: Text("Enter player Stats"),
                        ),
                        //  SizedBox(
                        //   height: 20.0,
                        //   width: 300,
                        //   // child: Text("Enter player Stats",style: TextStyle(fontSize: 18),),
                        //   child: Image.asset("images\enterstats.png",fit: BoxFit.cover)
                        // ),
                        Container(
                              decoration: BoxDecoration(
                              image: DecorationImage(
                      image: AssetImage("images/enterstats.png"),
                      
                      ),),
                                  height: 45,
                                  width: 300,
                                  
                    
                        ),
                         SizedBox(
                          height: 20.0,
                          // child: Text("Enter player Stats"),
                        ),

                      Container(
                        width: 800.0,
                        // margin: EdgeInsets.only(left: 0.0,right: 18.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: ListTile(
                                  title: Text('Innings'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Innings played',
                                    ),
                                    onChanged: (value) {
                                    setState(() {
                                    no_of_innings = value;
                                        });
                                      },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: ListTile(
                                  title: Text('Average'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Current Avegrage',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        average = value;
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
                          // child: Text("Enter player Stats"),
                        ),
                      Container(
                        width: 800.0,
                        // margin: EdgeInsets.only(left: 0.0,right: 18.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: ListTile(
                                  title: Text('Strike rate'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Strike rate',
                                    ),
                                    onChanged: (value) {
                                    setState(() {
                                    strike_rate = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                           SizedBox(
                              width: 35,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: ListTile(
                                  title: Text('Highest score'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Current high score',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        highest_score = value;
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
                          // child: Text("Enter player Stats"),
                        ),
                      Container(
                        width: 800.0,
                        // margin: EdgeInsets.only(left: 0.0,right: 18.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: ListTile(
                                  title: Text('Zeros'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Ducks',
                                    ),
                                    onChanged: (value) {
                                    setState(() {
                                    zeros = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: ListTile(
                                  title: Text('50s'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Half centuries',
                                    ),
                                    onChanged: (value) {
                                    setState(() {
                                    fifties = value;
                                        });
                                      },
                                  ),
                                ),
                              ),
                            ),
                            
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: ListTile(
                                  title: Text('100s'),
                                  subtitle: TextFormField(
                                    decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.all(Radius.circular(8))),
                                      hintText: 'Centuries',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        centuries = value;
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

                      Padding(
                        padding: const EdgeInsets.only(bottom :8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            url =
                                "https://rathoreabhiii.pythonanywhere.com/player/performance?player_name=$player_name&";
                            url += "opposition_name=$opposition_name&";
                            url += "ground=$ground&";
                            url += "country=$country&";
                            url += "no_of_innings=$no_of_innings&";
                            url += "average=$average&";
                            url += "strike_rate=$strike_rate&";
                            url += "highest_score=$highest_score&";
                            url += "zeros=$zeros&";
                            url += "fifties=$fifties&";
                            url += "centuries=$centuries";

                            changeButton = true;
                            data = await (fetchdata(url));
                            print(data);
                            var decoded = jsonDecode(data);
                            print(decoded);

                            setState(
                              () {
                                output = decoded; 
                                print(output);// inko un-comment kar lena apne hisaab se
                              },
                            );
                          },
                          child: Text("Calculate Total"),
                          style: TextButton.styleFrom(
                              minimumSize: Size(150, 40),
                              backgroundColor: Color.fromARGB(255, 48, 74, 190)),
                        ),
                      )
                    ],
                  )),

                  // Output wala neeche hai usko bhi uncomment kar lena sahuliyat ke hissab se

                   Container(
              height: changeButton ? 400 :0,
              width: changeButton ? 400 :0,
              
              child: Text(" Predicted score: \n \n ${output}",style:TextStyle(fontSize: 18.0) ,), 
            )
            ],
          ),
        ));
  }
}