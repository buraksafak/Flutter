import 'package:flutter/material.dart';
import 'package:food_appliaction/foods.dart';

class DetailScreen extends StatefulWidget {
  Foods food;

  DetailScreen(this.food);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.food.foodName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildImage(),
              buildFoodPriceText(),
              buildElevatedButtonSizedBox(),
            ],
          ),
        ));
  }

  Text buildFoodPriceText() {
    return Text("${widget.food.foodPrice} \u{20BA}",
                style: TextStyle(fontSize: 17, color: Colors.blueAccent));
  }

  SizedBox buildElevatedButtonSizedBox() {
    return SizedBox(
              width: 200,
              height: 50,
              child: buildOrderElevatedButton(),
            );
  }

  ElevatedButton buildOrderElevatedButton() {
    return ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
              ),
              child: Text("Order", style: TextStyle(color: Colors.white),),
              onPressed: () {
                print("${widget.food.foodName} ordered.");
              },
            );
  }

  Image buildImage() => Image.asset("images/${widget.food.foodImageName}");
}
