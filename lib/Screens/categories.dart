import 'package:flutter/material.dart';
import 'package:task_two/Data/dummy_data.dart';
import 'package:task_two/Screens/category_detail_screen.dart';
import 'package:task_two/Widget/categories_item.dart';

class Categories extends StatelessWidget {
  //const Categories({Key? key}) : super(key: key);

  static const routeName = '';

  @override
  Widget build(BuildContext context) {
    //DUMMY_CATEGORIES.
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: DUMMY_CATEGORIES.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
              onTap: (() {
                Navigator.of(context).pushNamed(CategoryDetails.routeName,
                    arguments: {
                      'id': DUMMY_CATEGORIES[index].id,
                      'title': DUMMY_CATEGORIES[index].title
                    });
              }),
              child: CategoriesItem(DUMMY_CATEGORIES[index].color,
                  DUMMY_CATEGORIES[index].title));
        });
  }
}
