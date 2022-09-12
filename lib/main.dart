import 'package:flutter/material.dart';
import 'package:task_two/Screens/category_detail_screen.dart';
import 'package:task_two/Screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        canvasColor: Color.fromARGB(255, 234, 214, 155)
      ),
      //home: HomeScreen(),
      routes: {
        '/':(ctx)=> HomeScreen(),
        CategoryDetails.routeName:(ctx)=> CategoryDetails(),
      },
    );
  }
}

