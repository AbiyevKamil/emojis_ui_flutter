import 'package:emojis_ui/model/screen_arguments.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  static const routeName = "/foodPage";
  const FoodPage({Key? key}) : super(key: key);
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late String imgPath, foodName, pricePerFood;
  late String action;
  late int price;
  bool isLiked = false;
  double count = 1;
  @override
  Widget build(BuildContext context) {
    final ScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    imgPath = args.imgPath!;
    foodName = args.foodName!;
    pricePerFood = args.pricePerFood!;
    price = int.parse(pricePerFood);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 45.0,
                        width: 45.0,
                        color: Colors.transparent,
                      ),
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 4.0,
                              offset: Offset(0.0, 4.0),
                            )
                          ],
                          color: Color(0xFFFE7D6A),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 1.0,
                        right: 4.0,
                        child: Container(
                          height: 12.0,
                          width: 12.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Text(
                "Super".toUpperCase(),
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Text(
                foodName.toUpperCase(),
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                tag: foodName,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFE7D6A).withOpacity(0.1),
                                blurRadius: 6.0,
                                spreadRadius: 6.0,
                                offset: Offset(5.0, 11.0),
                              )
                            ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: Color(0xFFFE7D6A),
                              size: 25.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Stack(children: <Widget>[
                    Container(
                      height: 45.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFE7D6A).withOpacity(0.1),
                            blurRadius: 6.0,
                            spreadRadius: 6.0,
                            offset: Offset(5.0, 11.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.restore,
                          color: Color(0xFFFE7D6A),
                          size: 25.0,
                        ),
                      ),
                    ),
                  ])
                ],
              )
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70.0,
                width: 125.0,
                color: Colors.white,
                child: Center(
                  child: Text(
                    '\$${(price * count).toInt()}',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Color(0xFF5E6166),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                    color: Color(0xFFFE7D6A),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        height: 40.0,
                        width: 105.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                visualDensity: VisualDensity.comfortable,
                                iconSize: 18.0,
                                icon: Icon(
                                  Icons.remove,
                                  color: Color(0xFFFE7D6A),
                                ),
                                onPressed: () {
                                  action = "MINUS";
                                  foodCountTracker(action);
                                }),
                            Expanded(
                              child: Text(
                                "${count.toInt()}",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFFFE7D6A),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            IconButton(
                                visualDensity: VisualDensity.comfortable,
                                iconSize: 18.0,
                                icon: Icon(
                                  Icons.add,
                                  color: Color(0xFFFE7D6A),
                                ),
                                onPressed: () {
                                  action = "PLUS";
                                  foodCountTracker(action);
                                }),
                          ],
                        )),
                    Text(
                      'Add to cart',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'FEATURED',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 225.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ListItem(columnNumber: '1'),
                ListItem(columnNumber: '2'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  foodCountTracker(String action) {
    switch (action) {
      case "PLUS":
        setState(() {
          count += 1;
        });
        return;
      case "MINUS":
        if (count > 0) {
          setState(() {
            count -= 1;
          });
        }
        return;
      default:
        return;
    }
  }
}

class ListItem extends StatelessWidget {
  final String columnNumber;
  const ListItem({Key? key, required this.columnNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            //Don't do this in a real app.
            if (columnNumber == '1')
              ColumnItem(
                imgPath: 'assets/images/cheese.png',
                foodName: 'Sweet cheese',
                price: '11',
                bgColor: Color(0xFFFBD6F5),
              ),
            if (columnNumber == '1') SizedBox(height: 15.0),
            if (columnNumber == '1')
              ColumnItem(
                imgPath: 'assets/images/popcorn.png',
                foodName: 'Sweet popcorn',
                price: '11',
                bgColor: Color(0xFFFBD6F5),
              ),
            if (columnNumber == '2')
              ColumnItem(
                imgPath: 'assets/images/taco.png',
                foodName: 'Tacos',
                price: '6',
                bgColor: Color(0xFFC2E3FE),
              ),
            if (columnNumber == '2') SizedBox(height: 15.0),
            if (columnNumber == '2')
              ColumnItem(
                imgPath: 'assets/images/sandwich.png',
                foodName: 'Sandwich',
                price: '6',
                bgColor: Color(0xFFD7FADA),
              ),
          ],
        ));
  }
}

class ColumnItem extends StatelessWidget {
  final String imgPath;
  final String foodName;
  final String price;
  final Color bgColor;
  const ColumnItem(
      {Key? key,
      required this.bgColor,
      required this.foodName,
      required this.imgPath,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FoodPage.routeName,
            arguments: ScreenArgs(
              foodName: foodName,
              imgPath: imgPath,
              pricePerFood: price,
            ));
      },
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
                    color: bgColor,
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
                  children: [
                    Text(
                      foodName,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$' + price,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF68D7F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
