import 'package:flutter/material.dart';
import 'package:number_guessing_game/screens/guess_screnn.dart';

void main() {
  runApp(MyApp());
}
//Coklu ekran destegi olan bir arayuz.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSizeInfo = MediaQuery.of(context);
    final double screenHeight = screenSizeInfo.size.height;
    final double screenWidth = screenSizeInfo.size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
            child: buildSingleChildScrollView(screenWidth, screenHeight, context)
        )
    );
  }

  SingleChildScrollView buildSingleChildScrollView(double screenWidth, double screenHeight, BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            buildGuessGameTextContainer(screenWidth),
            buildGuessImageContainer(screenHeight),
            buildStartGameButtonContainer(screenHeight, screenWidth, context)
          ],
        ),
      );
  }

  Container buildStartGameButtonContainer(double screenHeight, double screenWidth, BuildContext context) {
    return Container(
              padding: EdgeInsets.only(top: screenHeight / 20),
              height: screenHeight / 7,
              width: screenWidth / 2,
              child: buildStartGameElevatedButton(context),
            );
  }

  ElevatedButton buildStartGameElevatedButton(BuildContext context) {
    return ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.greenAccent),
              ),
              child: Text(
                "Start Game",
                style: TextStyle(
                    color: Colors.deepOrange, fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GuessScreen()));
              },
            );
  }

  Container buildGuessImageContainer(double screenHeight) {
    return Container(
              height: screenHeight/3,
                padding: EdgeInsets.only(top: screenHeight/20),
                child: Image.asset("images/number_guess.png")
            );
  }

  Container buildGuessGameTextContainer(double screenWidth) {
    return Container(
              padding: EdgeInsets.only(left: screenWidth/20, right: screenWidth/20),
              child: Text(
                "Guess Game",
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: screenWidth / 10,
                ),
              ),
            );
  }
}
