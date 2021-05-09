import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_guessing_game/screens/result_screen.dart';

class GuessScreen extends StatefulWidget {
  @override
  _GuessScreenState createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  var tfGuessControl = TextEditingController();
  int randomNumber = 0;
  int remainingRight = 5;
  String helpText = "";
  bool validate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomNumber = Random().nextInt(16); // 0-100 random number.
    print("Random number: $randomNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Guess Page"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildRemainingRightText(),
            buildHelpText(),
            //Guess button
            buildGuessNumberElevatedButtonSizedBox(context),
            buildInputGuessTextFieldPadding(),
          ],
        )
        )
    );
  }

  Padding buildInputGuessTextFieldPadding() {
    return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: buildInputGuessTextField(),
          );
  }

  TextField buildInputGuessTextField() {
    return TextField(
              controller: tfGuessControl,
              keyboardType: TextInputType.number,
              //only numbers for textfield
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: "Guess",
                  errorText: validate ? 'Value Can\'t Be Empty' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
            );
  }

  SizedBox buildGuessNumberElevatedButtonSizedBox(BuildContext context) {
    return SizedBox(
            width: 200,
            height: 50,
            child: buildGuessNumberElevatedButton(context),
          );
  }

  ElevatedButton buildGuessNumberElevatedButton(BuildContext context) {
    return ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.greenAccent),
              ),
              child: Text(
                "Guess Number",
                style: TextStyle(color: Colors.deepOrange, fontSize: 20),
              ),
              onPressed: () {
                tfGuessControl.text.isEmpty
                    ? validate = true
                    : validate = false;
                setState(() {
                  validate? null : remainingRight = remainingRight - 1;
                });
                int guess = int.parse(tfGuessControl.text);
                if (guess == randomNumber) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                result: true,
                              )));
                  return;
                }
                if (guess > randomNumber) {
                  setState(() {
                    helpText = "Down the guess";
                  });
                }
                if (guess < randomNumber) {
                  setState(() {
                    helpText = "Up the guess";
                  });
                }
                if (remainingRight == 0) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                result: false,
                              )));
                }
                tfGuessControl.text = "";
              },
            );
  }

  Text buildHelpText() {
    return Text(
            "Help : $helpText",
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 25,
            ),
          );
  }

  Text buildRemainingRightText() {
    return Text(
            "Remaining Right : $remainingRight",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 30,
            ),
          );
  }
}
