import 'package:emojis_ui/pages/food_page.dart';
import 'package:emojis_ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        HomePage.routeName: (context) => HomePage(),
        FoodPage.routeName: (context) => FoodPage(),
      },
    );
  }
}
