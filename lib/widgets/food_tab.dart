import 'package:flutter/material.dart';
import 'package:emojis_ui/widgets/food_tab_item.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          FoodTabItem(
              foodName: 'Delicious hot dog',
              ratingValue: 4,
              price: '6',
              imgPath: 'assets/images/hotdog.png'),
          FoodTabItem(
              foodName: 'Cheese pizza',
              ratingValue: 5,
              price: '12',
              imgPath: 'assets/images/pizza.png')
        ],
      ),
    );
  }
}
