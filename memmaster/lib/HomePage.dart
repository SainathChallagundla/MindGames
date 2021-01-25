import 'dart:math';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key key, this.title}) : super(key: key);

  //final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Key key = UniqueKey();
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
  int randomSeconds = 7;
  int entrySeconds = 15;
  @override
  void initState() {
    super.initState();
    //_HomePageState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        key: mainKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Game",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  iconSize: 50,
                  color: Colors.cyan,
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    print("Settings Button Pressed");
                  },
                ),
              ),
            ],
          ),
          SizedBox(width: 100),
          Visibility(
            child: _getTimer(_firsttimecontroller, randomSeconds),
            visible: visible,
          ),
          SizedBox(height: 10),
          Visibility(
            child: _getRamNum(),
            visible: visible,
          ),
          SizedBox(height: 10),
          _enableTextFields(),
          SizedBox(height: 10),
          _getTextFields(),
          SizedBox(height: 10),
          _getButtons(),
        ]));
  }

  Widget _getRamNum() {
    if (toGenRand) {
      list.clear();
      for (var i = 1; i <= 5; i++) {
        list.add(new Random().nextInt(99));
      }
      return Text(
          '     $list'
              .replaceAll("[", "")
              .replaceAll("]", "")
              .replaceAll(",", " "),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
    } else {
      return SizedBox(height: 0.1);
    }
  }

  Widget _compareTwoLists(var list1, list2) {
    if (list1.length != list2.length) {
      return _toast("Wrong");
    } else {
      for (var i = 0; i < list1.length; i++) {
        if (list1[i] != list2[i]) {
          return _toast("Wrong");
        }
      }
    }
    return _toast("Correct");
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

  // _showToast(BuildContext context, String message) {
  //   mainKey.currentState.showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }
  _toast(String message) {
    ToastView.createView(message, context, Toast.TOP, Toast.BOTTOM,
        Colors.black, Colors.white, 20, null);
  }

  Widget _getTextFields() {
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 120,
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
                    SizedBox(height: 10),
                    Container(
                        height: 40,
                        width: 120,
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
                    SizedBox(height: 10),
                    Container(
                        height: 40,
                        width: 120,
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
                    SizedBox(height: 10),
                    Container(
                        height: 40,
                        width: 120,
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
                    SizedBox(height: 10),
                    Container(
                        height: 40,
                        width: 120,
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

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                  child: Icon(
                    Icons.thumb_up,
                    size: 40.0,
                    color: Colors.cyan,
                  ),
                  onTap: () {
                    _compareTwoLists(list, _getTextFieldValues());
                  }),
              Text(
                "Submit",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        // RaisedButton(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //     color: Colors.cyan,
        //     child: new Text(
        //       'Submit',
        //       style: TextStyle(
        //           fontSize: 25,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white),
        //     ),
        //     onPressed: () {
        //       _compareTwoLists(list, _getTextFieldValues());
        //     }),
        Container(
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                  child: Icon(
                    Icons.autorenew,
                    size: 40.0,
                    color: Colors.cyan,
                  ),
                  onTap: () {
                    setState(() {
                      toGenRand = true;
                      visible = true;
                      isEnable = false;
                      _1processData();
                    });
                  }),
              Text(
                "Play Again",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _getTimer(CountDownController _controller, int seconds) {
    CountDownController _controller;
    if (toGenRand) {
      return CircularCountDownTimer(
        duration: seconds,
        autoStart: true,
        controller: _controller,
        width: 100,
        height: 100,
        color: Colors.white,
        fillColor: Colors.cyan,
        backgroundColor: null,
        strokeWidth: 5.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
            fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold),
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        onComplete: () {
          setState(() {
            visible = false;
            print('Countdown Ended');
          });
          toGenRand = false;
          isEnable = true;
        },
      );
    } else {
      return SizedBox(
        height: 0.1,
      );
    }
  }

  Widget _get2ndTimer(CountDownController _controller, int seconds) {
    CountDownController _controller;
    return CircularCountDownTimer(
      duration: seconds,
      controller: _controller,
      width: 100,
      height: 100,
      color: Colors.white,
      fillColor: Colors.cyan,
      backgroundColor: null,
      strokeWidth: 5.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      isReverse: true,
      isReverseAnimation: false,
      isTimerTextShown: true,
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
      return _toast("TimeUp");
    }
  }

  Widget _enableTextFields() {
    if (visible == false) {
      return _get2ndTimer(_secondtimecontroller, entrySeconds);
    } else {
      return Container();
    }
  }

  void _1processData() {
    setState(() {
      // Process your data and upload to server
      _formKey.currentState?.reset();
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
