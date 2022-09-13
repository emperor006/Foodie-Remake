import 'package:flutter/material.dart';
import 'package:task_two/Screens/categories.dart';
import 'package:task_two/Screens/filterscreen.dart';

class DrawerWidget extends StatelessWidget {
  TextStyle style = const TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  //const DrawerWidget({ Key? key }) : super(key: key);

  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isGlutenFree = false;

  DrawerWidget();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.brown,
            child: const Center(
              child: Text(
                'Cooking up!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //Navigator.of(context).pop();
             Navigator.of(context).pushReplacementNamed('/');

            },
            child: ListTile(
              leading: Icon(Icons.restaurant),
              title: Text(
                'Meals',
                style: style,
              ),
            ),
          ),
          InkWell(
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(Filter.routeName);
            }),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: style,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
