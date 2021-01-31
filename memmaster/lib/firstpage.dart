import 'package:flutter/material.dart';
import 'package:memmaster/HomePage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("meMaster"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.cyan,
                  child: new Text(
                    'Start Game',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
              IconButton(
                iconSize: 50,
                color: Colors.cyan,
                icon: Icon(Icons.help_outline),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AboutGame();
                    },
                  ));
                },
              ),
            ],
          ),
        ));
  }
}

class AboutGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Text(
                "About Game",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.wavy,
                  textBaseline: TextBaseline.alphabetic,
                  color: Colors.cyan,
                ),
              ),
              Text(
                "\n-->This is a Number Game."
                "\n-->It displays few numbers for few seconds    only."
                "\n-->After disappeared numbers we have to    enter those numbers on the Boxes before    timeup",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ));
  }
}
