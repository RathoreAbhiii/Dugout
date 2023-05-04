import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PCCricketFeedbackScreen extends StatefulWidget {
  const PCCricketFeedbackScreen({Key? key}) : super(key: key);

  @override
  State<PCCricketFeedbackScreen> createState() =>
      _PCCricketFeedbackScreenState();
}

class _PCCricketFeedbackScreenState extends State<PCCricketFeedbackScreen> {
  int _rating = 0;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  String text = '';
  bool change = false;
  // void _setstar(_setvalue) {
  //   setState(() {

  //   });
  // }

  // bool _setvalue(int _rating) {
  //   if (_rating == 5)
  //     return true;
  //   else
  //     return false;
  // }

  Widget _buildStar(int index) {
    Icon icon;
    if (index < _rating) {
      icon = Icon(Icons.star, color: Colors.orange);
    } else {
      icon = Icon(Icons.star_border, color: Colors.grey);
    }

    return GestureDetector(
      onTap: () => _setRating(index + 1),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromARGB(255, 132, 50, 209),
                Color.fromARGB(255, 252, 61, 210)
              ]),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/rate.png"),
                  ),
                ),
                height: 45,
                width: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => _buildStar(index)),
              ),
              SizedBox(
                // child: _rating=0 ? Text('') : Text('Thank you very much'),
                height: 70.0,
              ),
              SizedBox(
                height: 30.0,
                child: Text('Type your feedback and suggestions here ',
                    textAlign: TextAlign.left),
              ),
              TextFormField(
                maxLines: 4,
                maxLength: 100,
                decoration: InputDecoration(
                  // hintText: 'Type work feedback and suggestions here',
                  labelText: 'Please write your feedback and suggestions here',
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10, top: 30),
                  // height: changeButton ? 0 :20,
                  // width: changeButton ? 0 :150,

                  child: ElevatedButton(
                    onPressed: () {
                      change = true;
                      text = "Thank you for your valuable feedback";
                      setState(() {});
                    },
                    child: Text("Submit"),
                    style: TextButton.styleFrom(
                        minimumSize: Size(150, 40),
                        backgroundColor: Color.fromARGB(255, 48, 74, 190)),
                  )),
                  SizedBox(
                    height: 20.0,
                  // child: change? Text('Thank you for your valuable feedback'), : Tex
                  // child: Text('${text}'),
                  ),
                  SizedBox(
                  // child: change? Text('Thank you for your valuable feedback'), : Tex
                  child: Text('${text}'),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
