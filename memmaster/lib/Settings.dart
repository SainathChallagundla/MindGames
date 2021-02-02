import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'LocalStore.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _noOfDigits;
  int _noOfRandNums;
  int _displaySeconds;
  int _enterTime;

  @override
  void initState() {
    super.initState();
    onLoad();
  }

  onLoad() async {
    print("<=============== Settings  OnLoad Called================>");
    int noOfDigits = await getnoOfDigits();
    print("=========>Settings<==========noOfDigits$noOfDigits");

    setState(() {
      _noOfDigits = noOfDigits;
    });

    int noOfRandNums = await getnoOfRandNums();
    print("=========>Settings<==========noOfRandNums$noOfRandNums");

    setState(() {
      _noOfRandNums = noOfRandNums;
    });

    int displaySeconds = await getnoOfDigits();
    print("=========>Settings<==========displaySeconds$displaySeconds");
    setState(() {
      _displaySeconds = displaySeconds;
    });

    int enterTime = await getenterTime();
    print("=========>Settings<==========enterTime$enterTime");

    setState(() {
      _enterTime = enterTime;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            // NumberInputPrefabbed.roundedButtons(
            //   min: 3,
            //   max: 6,
            //   controller: TextEditingController(),
            //   incDecBgColor: Colors.amber,
            //   buttonArrangement: ButtonArrangement.incRightDecLeft,
            // ),
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
                initialValue: _noOfDigits,
                maxValue: 3,
                minValue: 1,
                step: 1,
                onValue: (value) async {
                  await setnoOfDigits(value);
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
                initialValue: _noOfRandNums,
                maxValue: 5,
                minValue: 2,
                step: 1,
                onValue: (value) async {
                  await setnoOfRandNums(value);
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
                initialValue: _displaySeconds,
                maxValue: 15,
                minValue: 3,
                step: 1,
                onValue: (value) async {
                  await setdisplaySeconds(value);
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
                initialValue: _enterTime,
                maxValue: 30,
                minValue: 7,
                step: 1,
                onValue: (value) async {
                  await setenterTime(value);
                },
              ),
            ),
            IconButton(
                icon: Icon(Icons.reset_tv),
                onPressed: () async {
                  await removedisplaySeconds();
                  await removenoOfDigits();
                  await removeenterTime();
                  await removenoOfRandNums();
                })
          ],
        ),
      ),
    );
  }
}

// Take 4 keys ..
