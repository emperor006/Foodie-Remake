import 'package:flutter/material.dart';
import 'package:task_two/Data/dummy_data.dart';
import 'package:task_two/Screens/meal_detail.dart';
import 'package:task_two/Widget/meals_item.dart';

import '../Models/meal.dart';

class CategoryDetails extends StatelessWidget {
  // const CategoryDetails({ Key? key }) : super(key: key);

  static const routeName = '/categoryDetail';

  CategoryDetails();
  @override
  Widget build(BuildContext context) {
    //has name of category and id of category
    //Todo--loop through DUMMYMEALS, find meals that fall under this
    //category and display them.
    Map<String, String> map =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    List<Meal> available = DUMMY_MEALS.where((element) {
      return element.categories.contains(map['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(map['title'] as String)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(MealDetailScreen.routeName,
                arguments:available[index]);
              },
              child: MealsItem(available[index]));
        },
        itemCount: available.length,
      ),
    );
  }
}
