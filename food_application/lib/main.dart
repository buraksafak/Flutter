import 'package:flutter/material.dart';
import 'package:food_appliaction/screens/detail_screen.dart';

import 'foods.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Foods>> getFoods() async {
    var foodList = <Foods>[];
    var food1 = Foods(1, "Kofte", "kofte.png", 19.99);
    var food2 = Foods(2, "Ayran", "ayran.png", 3.99);
    var food3 = Foods(3, "Baklava", "baklava.png", 19.99);
    var food4 = Foods(4, "Kadayif", "kadayif.png", 8.99);
    var food5 = Foods(5, "Fanta", "fanta.png", 4.99);
    var food6 = Foods(6, "Makarna", "makarna.png", 12.99);

    foodList.add(food1);
    foodList.add(food2);
    foodList.add(food3);
    foodList.add(food4);
    foodList.add(food5);
    foodList.add(food6);

    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods'),
      ),
      body: FutureBuilder<List<Foods>>(
        future: getFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var foodList = snapshot.data;
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                var food = foodList[index];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(food)));
                  },
                  child: buildCard(food),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }

  Card buildCard(Foods food) {
    return Card(
                  child: Row(
                    children: [
                      buildFoodImageSizedBox(food),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildFoodNameText(food),
                          SizedBox(
                            height: 50,
                          ),
                          buildFoodPriceText(food),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                );
  }

  SizedBox buildFoodImageSizedBox(Foods food) {
    return SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset("images/${food.foodImageName}"));
  }

  Text buildFoodNameText(Foods food) {
    return Text(
                            food.foodName,
                            style: TextStyle(fontSize: 20),
                          );
  }

  Text buildFoodPriceText(Foods food) {
    return Text(
                            "${food.foodPrice} \u{20BA}",
                            style: TextStyle(
                                fontSize: 22, color: Colors.blueAccent),
                          );
  }
}
