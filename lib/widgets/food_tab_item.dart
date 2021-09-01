import 'package:flutter/material.dart';
import 'package:emojis_ui/model/screen_arguments.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:emojis_ui/pages/food_page.dart';

class FoodTabItem extends StatelessWidget {
  final String foodName;
  final double ratingValue;
  final String price;
  final String imgPath;
  const FoodTabItem(
      {Key? key,
      required this.foodName,
      required this.ratingValue,
      required this.price,
      required this.imgPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double ratingCurrent = ratingValue;
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 210.0,
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFFFFE3DF),
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: RatingBar.builder(
                        glow: true,
                        initialRating: ratingCurrent,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 15.0,
                        itemPadding: EdgeInsets.only(right: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          ratingCurrent = rating;
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '\$' + price,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF68D7F)),
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          '\$${(int.parse(price) - 5) > 0 ? (int.parse(price) - 5).toString() : "1"}',
                          style: TextStyle(
                            fontSize: 12.0,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            onPressed: () {
              Navigator.pushNamed(context, FoodPage.routeName,
                  arguments: ScreenArgs(
                    foodName: foodName,
                    imgPath: imgPath,
                    pricePerFood: price,
                  ));
            },
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xFFFE7D6A),
          )
        ],
      ),
    );
  }
}
