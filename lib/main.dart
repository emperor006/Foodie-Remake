import 'package:flutter/material.dart';
import 'package:task_two/Screens/category_detail_screen.dart';
import 'package:task_two/Screens/favorites.dart';
import 'package:task_two/Screens/homescreen.dart';
import 'package:task_two/Screens/meal_detail.dart';

import 'Screens/categories.dart';
import 'Screens/filterscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  Map<String, bool> map = {};

  bool isLactoseFree = true;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isGlutenFree = false;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //const MyApp({Key? key}) : super(key: key);
  List<String> favoriteMeals = [];
  List<Map<String, Object>> screens = [];

  @override
  void didChangeDependencies() {
    screens = [
      {
        'page': Categories(), 'title': 'Categories'
        //, Favorites()
      },
      {
        'page': Favorites(favoriteMeals), 'title': 'Favorites'
        //, Favorites()
      }
    ];

    widget.map = {
      'isVegan': widget.isVegan,
      'isLactoseFree': widget.isLactoseFree,
      'isVegetarianFree': widget.isVegetarian,
      'isGlutenFree': widget.isGlutenFree,
    };

    super.didChangeDependencies();
  }

  void updateSelection(Map<String, bool> map) {
    setState(() {
      widget.map = map;
    });
  }

  void toggleFavorites(String id) {
    setState(() {
      if (favoriteMeals.contains(id)) {
        favoriteMeals.removeWhere((element) => element == id);
      } else {
        favoriteMeals.add(id);
      }
    });
  }

  bool switchFavoriteIcon(String id) {
    if (favoriteMeals.contains(id))
      return true;
    else
      return false;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.brown,
          canvasColor: Color.fromARGB(255, 234, 214, 155)),
      //home: HomeScreen(),
      routes: {
        '/': (ctx) => HomeScreen(screens),
        CategoryDetails.routeName: (ctx) => CategoryDetails(),
        Favorites.routeName: (ctx) => Favorites(favoriteMeals),
        Filter.routeName: (ctx) => Filter(widget.map,updateSelection),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavorites, switchFavoriteIcon),
      },
    );
  }
}
