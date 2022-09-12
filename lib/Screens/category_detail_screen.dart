import 'package:flutter/material.dart';
import 'package:task_two/Widget/meals_item.dart';

class CategoryDetails extends StatelessWidget {
  // const CategoryDetails({ Key? key }) : super(key: key);

  static const routeName = '/categoryDetail';

  CategoryDetails();
  @override
  Widget build(BuildContext context) {
    Map<String, String>map= ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title:Text(map['title'] as String)),
      body: MealsItem(),
    );
  }
}
