import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memmaster/LocalStore.dart';
import 'Settings.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  Key key = UniqueKey();
  var _num1 = new TextEditingController();
  var _num2 = new TextEditingController();
  var _num3 = new TextEditingController();
  var _num4 = new TextEditingController();
  var _num5 = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> mainKey = GlobalKey<ScaffoldState>();
  CountDownController _firsttimecontroller = CountDownController();
  CountDownController _secondtimecontroller = CountDownController();
  List<TextEditingController> _controllers = new List();
  List<int> randList = List();
  List<int> txtFieldsList = List();
  bool toGenRand = true;
  bool visible = true;
  bool isEnable = true;
  bool timet1AutoStart = true;
  bool timet2AutoStart = false;
  int _noOfDigits;
  int _noOfRandNums;
  int _displaySeconds;
  int _enterTime;
  bool _timer1ONstate = false;
  bool _timer2ONstate = false;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    onLoad();
  }

  onLoad() async {
    print("-------OnLoad Called--------");
    int noOfDigits = await getnoOfDigits();
    print("=========>HomePage<==========noOfDigits$noOfDigits");
    setnoOfDigits(noOfDigits);
    // if (noOfDigits == null) {
    //   print("onLoyrff86fftft7f9f9ftftyfft7$noOfDigits");
    //   noOfDigits = 2;
    //   await setnoOfDigits(noOfDigits);
    // }
    setState(() {
      _noOfDigits = noOfDigits;
    });

    int noOfRandNums = await getnoOfRandNums();
    print("=========>HomePage<==========noOfRandNums$noOfRandNums");
    setnoOfRandNums(noOfRandNums);
    // if (noOfRandNums == null) {
    //   noOfRandNums = 5;
    //   await setnoOfRandNums(noOfRandNums);
    // }
    setState(() {
      _noOfRandNums = noOfRandNums;
    });

    int displaySeconds = await getnoOfDigits();
    print("=========>HomePage<==========displaySeconds$displaySeconds");
    setdisplaySeconds(displaySeconds);
    // if (displaySeconds == null) {
    //   displaySeconds = 7;
    //   await setdisplaySeconds(displaySeconds);
    // }
    setState(() {
      _displaySeconds = displaySeconds;
    });

    int enterTime = await getenterTime();
    print("=========>HomePage<==========enterTime$enterTime");
    setenterTime(enterTime);
    // if (enterTime == null) {
    //   enterTime = 14;
    //   await setenterTime(enterTime);
    // }
    setState(() {
      _enterTime = enterTime;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      print('state = $state');
      _firsttimecontroller.pause();
    } else if (state == AppLifecycleState.resumed) {
      print('state = $state');
      _firsttimecontroller.resume();
    } else if (state == AppLifecycleState.paused) {
      _secondtimecontroller.pause();
    } else if (state == AppLifecycleState.resumed) {
      _secondtimecontroller.resume();
    }
    //print('state = $state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        key: mainKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Random Numbers Game",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      iconSize: 50,
                      color: Colors.cyan,
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Settings();
                          },
                        ));
                        print("Settings Button Pressed");
                      },
                    ),
                  ),
                ],
              ),
              //SizedBox(width: 100),
              Visibility(
                child: _getTimer1(),
                visible: visible,
              ),
              //SizedBox(height: 10),
              Visibility(
                child: _getRamNum(),
                visible: visible,
              ),
              // SizedBox(height: 10),
              _enableTextFields(),
              // SizedBox(height: 10),
              // _getTextFields(),
              // SizedBox(height: 10),
              // _getButtons(),
            ]))));
  }

  Widget _getRamNum() {
    int digits;
    if (toGenRand) {
      randList.clear();
      if (_noOfDigits == 1) {
        digits = 9;
      } else if (_noOfDigits == 2) {
        digits = 99;
      } else if (_noOfDigits == 3) {
        digits = 999;
      }
      for (var i = 1; i <= _noOfRandNums; i++) {
        randList.add(new Random().nextInt(digits));
      }
      print(randList);
      return Text(
          '$randList'
              .replaceAll("[", "")
              .replaceAll("]", "")
              .replaceAll(",", " "),
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold));
    } else {
      return SizedBox(height: 0.1);
    }
  }

  List<int> _getTextFieldValues() {
    txtFieldsList.clear();
    if ((_num1.text != "") &&
        (_num2.text != "") &&
        (_num3.text != "") &&
        (_num4.text != "") &&
        (_num5.text != "")) {
      int num1 = int.parse(_num1.text);
      int num2 = int.parse(_num2.text);
      int num3 = int.parse(_num3.text);
      int num4 = int.parse(_num4.text);
      int num5 = int.parse(_num5.text);
      // txtFieldsList = [num1, num2, num3, num4, num5];
      txtFieldsList.addAll([num1, num2, num3, num4, num5]);
      print(txtFieldsList);
      return txtFieldsList;
    }
    _toast("Wrong");
    return null;
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

  bool _compareTwoLists2(var list1, list2) {
    if (list1.length != list2.length) {
      return false;
    } else {
      for (var i = 0; i < list1.length; i++) {
        if (list1[i] != list2[i]) {
          return false;
        }
      }
    }
    return true;
  }

  // _showToast(BuildContext context, String message) {
  //   mainKey.currentState.showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }
  _toast(String message) {
    ToastView.createView(message, context, Toast.TOP, Toast.BOTTOM, Colors.cyan,
        Colors.white, 20, null);
  }

  Widget _getTextFields() {
    return Form(
        key: _formKey,
        child: FocusScope(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    inputBorderedTextFormField(_num1, 2),
                    SizedBox(height: 10),
                    inputBorderedTextFormField(_num2, 2),
                    SizedBox(height: 10),
                    inputBorderedTextFormField(_num3, 2),
                    SizedBox(height: 10),
                    inputBorderedTextFormField(_num4, 2),
                    SizedBox(height: 10),
                    inputBorderedTextFormField(_num5, 2),
                  ]),
            ])));
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(25.0),
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.autorenew,
                ),
                iconSize: 50,
                color: Colors.cyan,
                splashColor: Colors.cyan,
                onPressed: () {
                  // _firsttimecontroller.restart();
                  _formKey.currentState?.reset();
                  _num1.clear();
                  _num2.clear();
                  _num3.clear();
                  _num4.clear();
                  _num5.clear();
                  setState(() {
                    timet1AutoStart = true;
                    toGenRand = true;
                    visible = true;
                    //isEnable = false;
                  });
                  if (_timer1ONstate != true) {
                    _firsttimecontroller.start();
                    print("Start");
                  } else {
                    print("Restart");
                    _firsttimecontroller?.restart();
                  }
                  //_timerController.restart();
                },
              ),
              Text("Play Again"),
            ])),
        Container(
            padding: EdgeInsets.all(25.0),
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                ),
                iconSize: 50,
                color: Colors.cyan,
                splashColor: Colors.cyan,
                onPressed: () {
                  txtFieldsList = _getTextFieldValues();
                  _compareTwoLists(randList, txtFieldsList);
                  if (_timer2ONstate != false) {
                    return _secondtimecontroller.pause();
                  }
                },
              ),
              Text("Submit"),
            ])),
      ],
    );
  }

  Widget _getTimer1() {
    if (toGenRand) {
      return CircularCountDownTimer(
        duration: _displaySeconds,
        autoStart: timet1AutoStart,
        controller: _firsttimecontroller,
        width: 100,
        height: 100,
        color: Colors.grey[300],
        fillColor: Colors.cyanAccent[400],
        backgroundColor: Colors.cyan[500],
        strokeWidth: 10.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
            fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold),
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        onStart: () {
          _timer1ONstate = true;
        },
        onComplete: () {
          setState(() {
            visible = false;
            print('Countdown Ended');
          });
          toGenRand = false;
          _timer1ONstate = false;
          timet2AutoStart = true;
        },
      );
    } else {
      return SizedBox(
        height: 0.1,
      );
    }
  }

  // Widget _getTimer() {
  //   if (toGenRand) {
  //     return Container(
  //       margin: EdgeInsets.symmetric(vertical: 10),
  //       child: SimpleTimer(
  //         duration: const Duration(seconds: 5),
  //         controller: _timerController,
  //         timerStyle: _timerStyle,
  //         onStart: handleTimerOnStart,
  //         onEnd: handleTimerOnEnd,
  //         valueListener: timerValueChangeListener,
  //         backgroundColor: Colors.grey,
  //         progressIndicatorColor: Colors.green,
  //         progressIndicatorDirection: TimerProgressIndicatorDirection.clockwise,
  //         progressTextCountDirection:
  //             TimerProgressTextCountDirection.count_down,
  //         progressTextStyle: TextStyle(color: Colors.black),
  //         strokeWidth: 10,
  //       ),
  //     );
  //   } else {
  //     return SizedBox(height: 1);
  //   }
  // }

  Widget _getTimer2(CountDownController _controller, int seconds) {
    return CircularCountDownTimer(
      duration: seconds,
      controller: _controller,
      width: 100,
      height: 100,
      color: Colors.grey[300],
      fillColor: Colors.cyanAccent[400],
      backgroundColor: Colors.cyan[500],
      //backgroundColor: null,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      isReverse: true,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: timet2AutoStart,
      onStart: () {
        _timer2ONstate = true;
      },
      onComplete: () {
        setState(() {
          isEnable = false;
        });
        _timer2ONstate = false;
        _textFieldsDisableIfNUll();
      },
    );
  }

  _textFieldsDisableIfNUll() {
    if ((_num1.text == "") &&
        (_num2.text == "") &&
        (_num3.text == "") &&
        (_num4.text == "") &&
        (_num5.text == "")) {
      return _toast("TimeUp");
    }
  }

  Widget _enableTextFields() {
    if (visible == false) {
      return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            _getTimer2(_secondtimecontroller, _enterTime),
            SizedBox(height: 10),
            _getTextFields(),
            _getButtons(),
          ]));
    } else {
      return SizedBox(
        height: 1,
      );
    }
  }

  Widget inputBorderedTextFormField(
      TextEditingController controller, int maxLength) {
    return Container(
        height: 40,
        width: 120,
        child: TextFormField(
          // focusNode: _focusnode,
          //autofocus: true,
          inputFormatters: <TextInputFormatter>[
            new LengthLimitingTextInputFormatter(maxLength),
            FilteringTextInputFormatter.digitsOnly
          ],
          enabled: isEnable,
          textAlign: TextAlign.center,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
          controller: controller,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          cursorHeight: 25,
          cursorWidth: 3.0,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            isDense: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.cyan, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
        ));
  }
}
