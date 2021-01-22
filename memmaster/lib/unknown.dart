/*Widget listOfWidgets(int numb) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < numb; i++) {
      list.add(Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(color: Colors.red),
          child: FittedBox(
            fit: BoxFit.fitWidth,
          )));
    }
    return Wrap(
        spacing: 5.0, // gap between adjacent chips
        runSpacing: 2.0, // gap between lines
        children: list);
  }*/

/*Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: List<Widget>.generate(5, (int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(const Size(60, 30)),
                            child: Form(
                              key: GlobalKey(),
                              child: TextFormField(
                                onSaved: (value) {
                                  textFielsValues.add(int.parse(value));
                                  print(
                                      'Value for field $index saved as "$value"');
                                  print(textFielsValues);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)))),
                              ),
                              //TextFormField(
                              //   onSaved: (String value) {
                              //     print('Value for field $index saved as "$value"');
                              //   },
                              // ),
                            )),
                      );
                    }),
                  ),
                ],
              ),*/
/////USED FOR DILOGBOC FOR WRONG
// Widget _showAlertDialogforWrong() {
//     // set up the button
//     Widget okButton = FlatButton(
//       child: Text("ok"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//     AlertDialog alert = AlertDialog(
//       title: Text(
//         "Oops \nTry Again",
//       ),
//       content: Icon(
//         Icons.dangerous,
//         color: Colors.red,
//         size: 150.0,
//       ),
//       actions: [
//         okButton,
//       ],
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

/////USED FOR DILOGBOC FOR WRONG
// // Widget _showAlertDialogforCorrect() {
//     // set up the button
//     Widget okButton = FlatButton(
//       child: Text("ok"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//     AlertDialog alert = AlertDialog(
//       titlePadding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
//       title: Text(
//         "Correct",
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//       ),
//       content: Icon(
//         Icons.done,
//         color: Colors.green,
//         size: 100.0,
//       ),
//       actions: [
//         okButton,
//       ],
//       contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
