import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    int digitLength = 2;
    int randNumLength = 5;
    int displaySeconds = 7;
    int enterTime = 10;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Select How Many Digits Number Do You Want",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              child: CustomNumberPicker(
                valueTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                customAddButton: Icon(
                  Icons.add,
                  size: 30,
                ),
                customMinusButton: Icon(
                  Icons.remove,
                  size: 30,
                ),
                initialValue: digitLength,
                maxValue: 5,
                minValue: 2,
                step: 1,
                onValue: (value) {
                  print(value.toString());
                },
              ),
            ),
            Text(
              "Select No Of Random Numbers Do You Want",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              child: CustomNumberPicker(
                valueTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                customAddButton: Icon(
                  Icons.add,
                  size: 30,
                ),
                customMinusButton: Icon(
                  Icons.remove,
                  size: 30,
                ),
                initialValue: randNumLength,
                maxValue: 30,
                minValue: 3,
                step: 1,
                onValue: (value) {
                  print(value.toString());
                },
              ),
            ),
            Text(
              "choose How Many seconds do you want to Display Random Numbers ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              child: CustomNumberPicker(
                valueTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                customAddButton: Icon(
                  Icons.add,
                  size: 30,
                ),
                customMinusButton: Icon(
                  Icons.remove,
                  size: 30,
                ),
                initialValue: displaySeconds,
                maxValue: 30,
                minValue: 3,
                step: 1,
                onValue: (value) {
                  print(value.toString());
                },
              ),
            ),
            Text(
              "Select How Many seconds do u want to Enter Numbers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              child: CustomNumberPicker(
                valueTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                customAddButton: Icon(
                  Icons.add,
                  size: 30,
                ),
                customMinusButton: Icon(
                  Icons.remove,
                  size: 30,
                ),
                initialValue: enterTime,
                maxValue: 10,
                minValue: 2,
                step: 1,
                onValue: (value) {
                  print(value.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Take 4 keys ..
setValue(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
}
