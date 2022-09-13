import 'package:flutter/material.dart';
import 'package:task_two/Data/dummy_data.dart';

import '../Widget/meals_item.dart';
import 'meal_detail.dart';

class Favorites extends StatelessWidget {
  // const Favorites({Key? key}) : super(key: key);

  static const routeName = '/favorite';
  List<String> favorite;

  Favorites(this.favorite);

  @override
  Widget build(BuildContext context) {
    return favorite.isNotEmpty
        ? ListView.builder(
            itemBuilder: (ctx, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(MealDetailScreen.routeName,
                        arguments: DUMMY_MEALS.firstWhere(
                            (element) => element.id == favorite[index]));
                  },
                  child: MealsItem(DUMMY_MEALS
                      .firstWhere((element) => element.id == favorite[index])));
            },
            itemCount: favorite.length,
          )
        : const Center(
            child: Text('You do not have any favorite meal to show'),
          );
  }
}
