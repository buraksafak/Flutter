import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  bool result;

  ResultScreen({this.result});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSizeInfo = MediaQuery.of(context);
    final double screenHeight = screenSizeInfo.size.height;
    final double screenWidth = screenSizeInfo.size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Result Page"),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              buildResultImageContainer(screenHeight, screenWidth),
              buildResultTextContainer(screenWidth),
              buildTryAgainButtonContainer(screenHeight, screenWidth, context)
            ],
          ),
        )));
  }

  Container buildTryAgainButtonContainer(double screenHeight, double screenWidth, BuildContext context) {
    return Container(
              padding: EdgeInsets.only(top: screenHeight / 20),
              height: screenHeight / 7,
              width: screenWidth / 2,
              child: buildTryAgainElevatedButton(context),
            );
  }

  ElevatedButton buildTryAgainElevatedButton(BuildContext context) {
    return ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellowAccent),
                ),
                child: Text(
                  "Try Again",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
  }

  Container buildResultTextContainer(double screenWidth) {
    return Container(
              padding: EdgeInsets.only(
                  left: screenWidth / 20, right: screenWidth / 20),
              child: Text(
                "You are WINNER",
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: screenWidth / 10,
                ),
              ),
            );
  }

  Container buildResultImageContainer(double screenHeight, double screenWidth) {
    return Container(
                height: screenHeight / 4,
                padding: EdgeInsets.only(top: screenWidth / 500),
                child: widget.result
                    ? Image.asset("images/smile.png")
                    : Image.asset("images/sad.png")
            );
  }
}
