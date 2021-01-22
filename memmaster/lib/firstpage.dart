import 'package:flutter/material.dart';
import 'package:memmaster/HomePage.dart';
import 'package:styled_text/styled_text.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstPage"),
      ),
      body: Column(
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
            ),
          ),
          Text(
            "\n-->This is a Number Game.\n-->It displays few numbers for few seconds only.\n-->After disappeared numbers we have to enter those numbers on the Boxes before timeup",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          // StyledText(
          //   newLineAsBreaks: true,
          //   maxLines: 20,
          //   text:
          //       "<bold>About Game:</bold>\n-->This is Number Game.\n-->it displays few numbers for few seconds only.\n->After Disapered those numbers we have to enter those numbers on the Boxes before timeup ",
          //   styles: {
          //     'bold': TextStyle(
          //         color: Colors.black,
          //         fontSize: 30,
          //         fontWeight: FontWeight.bold),
          //   },
          // ),
          RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.blue,
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
        ],
      ),
    );
  }
}
