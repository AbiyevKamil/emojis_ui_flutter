import 'package:emojis_ui/model/screen_arguments.dart';
import 'package:emojis_ui/pages/food_page.dart';
import 'package:flutter/material.dart';

class HomePageItem extends StatelessWidget {
  final String imgPath;
  final String foodname;
  final String price;
  final Color txtColor;
  final Color bgColor;
  const HomePageItem(
      {Key? key,
      required this.imgPath,
      required this.price,
      required this.txtColor,
      required this.bgColor,
      required this.foodname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FoodPage.routeName,
            arguments: ScreenArgs(
              foodName: foodname,
              imgPath: imgPath,
              pricePerFood: price,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: 175.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
        ),
        child: Column(
          children: [
            Hero(
              tag: foodname,
              child: Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    imgPath,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              foodname,
              style: TextStyle(fontSize: 17.0, color: txtColor),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "\$$price",
              style: TextStyle(fontSize: 17.0, color: txtColor),
            ),
          ],
        ),
      ),
    );
  }
}
