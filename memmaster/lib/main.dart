import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'HomePage.dart';

void main() => runApp(new MaterialApp(
    theme: new ThemeData(
        primaryColor: Colors.cyan,
        primaryColorDark: Colors.tealAccent[900],
        accentColor: Colors.tealAccent),
    home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Memory Master',
        style: TextStyle(
            color: Colors.cyan,
            decorationStyle: TextDecorationStyle.wavy,
            //fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            fontSize: 50.0),
      ),
      seconds: 1,
      loadingText: Text(
        'Welcome To Meemory Games ',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
      useLoader: true,
      navigateAfterSeconds: new HomePage(),
      //image: new Image.asset('assets/Images/GimpStStrokePink.png'),
      // imageBackground:
      //     new AssetImage('assets/display images/Eiffel Tower.jpeg'),
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.white, Colors.cyan[100], Colors.cyan[100]],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:memmaster/HomePage.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }
