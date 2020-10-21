import 'package:flutter/material.dart';
import 'package:calculator/calculate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOVE CALCULATOR',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String firstName;
  String secondName;
  int score;
  void loveScore() {
    score = calculate(firstName: firstName, secondName: secondName);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SecondRoute(score: score)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent[200],
        shadowColor: Colors.black,
        title: Text("Friendship Calculator"),
      ),
      body: Stack(children: [
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 170),
              child: Hero(
                  tag: 'gif',
                  child: Image(
                      height: 300.0, image: AssetImage('images/logo.gif'))),
            ),
          ),
        ),
        Column(children: [
          Container(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 348, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.purple[300], Colors.purple[400]])),
                    height: 150,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 355, 300.0, 0.0),
                  child: TextField(
                      onChanged: (value) {
                        firstName = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Enter First Name',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(280.0, 355, 20.0, 0.0),
                  child: TextField(
                      onChanged: (value) {
                        secondName = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Enter Second Name',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200.0, 430, 50.0, 0.0),
                  child: RaisedButton(
                      color: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      onPressed: loveScore,
                      child: Text(
                        'Calculate',
                        style: TextStyle(color: Colors.blue),
                      )),
                )
              ],
            ),
          ),
        ])
      ]),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({
    Key key,
    this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Hero(
              tag: 'gif',
              child:
                  Center(child: Image(image: AssetImage('images/logo.gif')))),
        ),
        Text(
          'Your LoveScore is $score',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: 2.0,
              fontSize: 30),
        )
      ]),
    );
  }
}
