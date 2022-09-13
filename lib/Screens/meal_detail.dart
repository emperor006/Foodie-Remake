import 'package:flutter/material.dart';
import '../Models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealdetailscreen';
  //const MealDetail({ Key? key }) : super(key: key);

  var toggleIcon;
  var toggleFavorite;
  MealDetailScreen(this.toggleFavorite, this.toggleIcon);

  Widget displayHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

//builds listview items for ingredient
  Widget getListviewItems(String ingredient) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image(image: Image.network(meal.imageUrl)),
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
                padding: EdgeInsets.only(top: 30),
                child: displayHeader('Ingredients')),

            Container(
              margin: EdgeInsets.fromLTRB(50, 15, 50, 15),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: ((context, index) => Container(
                        height: 40,
                        child: Card(
                          color: Colors.amber,
                          child: Center(child: Text(meal.ingredients[index])),
                        ),
                      )),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: displayHeader('Steps')),

            Container(
              margin: const EdgeInsets.fromLTRB(50, 15, 50, 15),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: ((context, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('#${index + 1}'),
                            ),
                            title: Text(
                              meal.steps[index],
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                          Divider()
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: toggleIcon(meal.id)? Icon(Icons.star):Icon(Icons.star_border_outlined) ,
          onPressed: () {
            toggleFavorite(meal.id);
          },
          backgroundColor: Colors.amber),
    );
  }
}
