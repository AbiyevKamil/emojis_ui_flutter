import 'package:emojis_ui/model/screen_arguments.dart';
import 'package:emojis_ui/pages/food_page.dart';
import 'package:emojis_ui/widgets/food_tab.dart';
import 'package:emojis_ui/widgets/home_page_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/";
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(25.0),
                  onTap: () {},
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 40.0,
                  ),
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 3.0))
                      ],
                      color: Color(0xFFC6E7FE),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/tuxedo.png'),
                        fit: BoxFit.contain,
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Text(
                "Search for".toUpperCase(),
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Text(
                "Recipes".toUpperCase(),
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: TextField(
                cursorColor: Colors.grey.withOpacity(0.8),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200.0,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              scrollDirection: Axis.horizontal,
              children: [
                HomePageItem(
                  foodname: 'Hamburg',
                  imgPath: 'assets/images/burger.png',
                  price: '21',
                  bgColor: Color(0xFFFFE9C6),
                  txtColor: Color(0xFFDA9551),
                ),
                SizedBox(
                  width: 15.0,
                ),
                HomePageItem(
                  foodname: 'Chips',
                  imgPath: 'assets/images/fries.png',
                  price: '15',
                  bgColor: Color(0xFFC2E3FE),
                  txtColor: Color(0xFF6A8CAA),
                ),
                SizedBox(
                  width: 15.0,
                ),
                HomePageItem(
                  foodname: 'Donuts',
                  imgPath: 'assets/images/doughnut.png',
                  price: '15',
                  bgColor: Color(0xFFD7FADA),
                  txtColor: Color(0xFF56CC7E),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(child: Text('FEATURED')),
                Tab(child: Text('COMBO')),
                Tab(child: Text('FAVORITES')),
                Tab(child: Text('RECOMMENDED')),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(
              controller: tabController,
              children: [
                FoodTab(),
                FoodTab(),
                FoodTab(),
                FoodTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
