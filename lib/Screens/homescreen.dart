import 'package:flutter/material.dart';
import 'package:task_two/Screens/favorites.dart';
import 'package:task_two/Widget/drawer.dart';

import 'categories.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  // List<Map<String, Object>> screens = [
  //   {
  //     'page': Categories(), 'title': 'Categories'
  //     //, Favorites()
  //   },
  //   {
  //     'page': Favorites(), 'title': 'Favorites'
  //     //, Favorites()
  //   }
  // ];

  List<Map<String, Object>> screens;
  HomeScreen(this.screens);

  int initialIndex = 0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void chooseTab(int index) {
    setState(() {
      widget.initialIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> widgetList = widget.screens;

    return Scaffold(
      appBar: AppBar(
        title: Text(widgetList[widget.initialIndex]['title'] as String),
      ),
      body: widgetList[widget.initialIndex]['page'] as Widget,
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown,
        currentIndex: widget.initialIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        onTap: chooseTab,
      ),
    );
  }
}
