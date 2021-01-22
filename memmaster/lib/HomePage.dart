import 'dart:math';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _num1 = new TextEditingController();
  var _num2 = new TextEditingController();
  var _num3 = new TextEditingController();
  var _num4 = new TextEditingController();
  var _num5 = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final mainKey = GlobalKey<ScaffoldState>();
  CountDownController _firsttimecontroller = CountDownController();
  CountDownController _secondtimecontroller = CountDownController();
  List<int> list = List();
  List<int> _list = List();
  bool toGenRand = true;
  bool visible = true;
  bool isEnable = false;
  // @override
  // void initState() {
  //   super.initState();
  //   //startTime();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: mainKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("HomePage"),
        ),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Visibility(
                child: _getTimer(_firsttimecontroller, 10),
                visible: visible,
              ),
              Visibility(
                child: _getRamNum(),
                visible: visible,
              ),
              //_getTime(_secondtimecontroller,10),
              _enableTextFields(),
              _getTextFields(),
              _getraisedButtons(),
            ])));
  }

  Widget _getRamNum() {
    if (toGenRand) {
      list.clear();
      for (var i = 1; i <= 5; i++) {
        list.add(new Random().nextInt(99));
      }
      return Text(
          '$list'.replaceAll("[", "").replaceAll("]", "").replaceAll(",", " "),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
    } else {
      return Container();
    }
  }

  Widget _compareTwoLists(var list1, list2) {
    if (list1.length != list2.length) {
      return _showToast(context, "Wrong");
    } else {
      for (var i = 0; i < list1.length; i++) {
        if (list1[i] != list2[i]) {
          return _showToast(context, "Wrong");
        }
      }
    }
    return _showToast(context, "Correct");
  }

  List<int> _getTextFieldValues() {
    _list.clear();
    int num1 = int.parse(_num1.text);
    int num2 = int.parse(_num2.text);
    int num3 = int.parse(_num3.text);
    int num4 = int.parse(_num4.text);
    int num5 = int.parse(_num5.text);
    _list = [num1, num2, num3, num4, num5];
    return _list;
  }

  _showToast(BuildContext context, String message) {
    mainKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Widget _getTextFields() {
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 60,
                      child: TextFormField(
                        enabled: isEnable,
                        controller: _num1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(3)
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                      ),
                    ),
                    Container(
                        height: 40,
                        width: 60,
                        child: TextFormField(
                          controller: _num2,
                          enabled: isEnable,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(3)
                          ],
                        )),
                    Container(
                        height: 40,
                        width: 60,
                        child: TextFormField(
                          controller: _num3,
                          enabled: isEnable,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(3)
                          ],
                        )),
                    Container(
                        height: 40,
                        width: 60,
                        child: TextFormField(
                          controller: _num4,
                          enabled: isEnable,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(3)
                          ],
                        )),
                    Container(
                        height: 40,
                        width: 60,
                        child: TextFormField(
                          controller: _num5,
                          enabled: isEnable,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(3)
                          ],
                        )),
                  ]),
            ]));
  }

  Widget _getraisedButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.blue,
            child: new Text(
              'Submit',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onPressed: () {
              _compareTwoLists(list, _getTextFieldValues());
            }),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.blue,
          child: new Text(
            'play again',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () {
            _1processData();
          },
        ),
      ],
    );
  }

  Widget _getTimer(CountDownController _controller, int seconds) {
    CountDownController _controller;

    return CircularCountDownTimer(
      // Countdown duration in Seconds
      duration: seconds,

      // Controller to control (i.e Pause, Resume, Restart) the Countdown
      controller: _controller,

      // Width of the Countdown Widget
      width: 100,

      // Height of the Countdown Widget
      height: 100,

      // Default Color for Countdown Timer
      color: Colors.white,

      // Filling Color for Countdown Timer
      fillColor: Colors.blue,

      // Background Color for Countdown Widget
      backgroundColor: null,

      // Border Thickness of the Countdown Circle
      strokeWidth: 5.0,

      // Begin and end contours with a flat edge and no extension
      strokeCap: StrokeCap.round,

      // Text Style for Countdown Text
      textStyle: TextStyle(
          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),

      // true for reverse countdown (max to 0), false for forward countdown (0 to max)
      isReverse: true,

      // true for reverse animation, false for forward animation
      isReverseAnimation: false,

      // Optional [bool] to hide the [Text] in this widget.
      isTimerTextShown: true,

      // Function which will execute when the Countdown Ends
      onComplete: () {
        setState(() {
          visible = false;
          print('Countdown Ended');
        });
        toGenRand = false;
        isEnable = true;
      },
    );
  }

  Widget _get2ndTimer(CountDownController _controller, int seconds) {
    CountDownController _controller;

    return CircularCountDownTimer(
      // Countdown duration in Seconds
      duration: seconds,

      // Controller to control (i.e Pause, Resume, Restart) the Countdown
      controller: _controller,

      // Width of the Countdown Widget
      width: 100,

      // Height of the Countdown Widget
      height: 100,

      // Default Color for Countdown Timer
      color: Colors.white,

      // Filling Color for Countdown Timer
      fillColor: Colors.blue,

      // Background Color for Countdown Widget
      backgroundColor: null,

      // Border Thickness of the Countdown Circle
      strokeWidth: 5.0,

      // Begin and end contours with a flat edge and no extension
      strokeCap: StrokeCap.round,

      // Text Style for Countdown Text
      textStyle: TextStyle(
          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),

      // true for reverse countdown (max to 0), false for forward countdown (0 to max)
      isReverse: true,

      // true for reverse animation, false for forward animation
      isReverseAnimation: false,

      // Optional [bool] to hide the [Text] in this widget.
      isTimerTextShown: true,

      // Function which will execute when the Countdown Ends
      onComplete: () {
        setState(() {
          isEnable = false;
        });
        _textFieldsDisableIfNUll();
      },
    );
  }

  Widget _textFieldsDisableIfNUll() {
    if ((_num1.text == "" || null) &&
        (_num2.text == "" || null) &&
        (_num3.text == "" || null) &&
        (_num4.text == "" || null) &&
        (_num5.text == "" || null)) {
      return _showToast(context, "TimeUp");
    }
  }

  Widget _enableTextFields() {
    if (visible == false) {
      return _get2ndTimer(_secondtimecontroller, 20);
    } else {
      return Container();
    }
  }

  void _1processData() {
    setState(() {
      // Process your data and upload to server
      _formKey.currentState?.reset();
    });
    toGenRand = true;
  }

  void _2processData() {
    // Process your data and upload to server
    setState(() {
      _firsttimecontroller.restart(duration: 5);
    });
  }

  // Widget _getTextFormField(
  //     TextInputType keyboardType, TextEditingController controller,
  //     [int minLines = 1, int maxLines = 1]) {
  //   return TextFormField(
  //     autocorrect: true,
  //     keyboardType: keyboardType,
  //     maxLines: maxLines,
  //     controller: controller,
  //     style: TextStyle(fontSize: 18),
  //     decoration: InputDecoration(
  //         isDense: true,
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Colors.orangeAccent, width: 1.0),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Colors.orangeAccent, width: 1.0),
  //         )),
  //   );
  // }

}
