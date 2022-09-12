import 'package:flutter/material.dart';
import '../Models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealdetailscreen';
  //const MealDetail({ Key? key }) : super(key: key);
  MealDetailScreen();

  Widget displayHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
//builds listview items for ingredient
Widget getListviewItems(String ingredient){
  return Container();
}
//
  @override
  Widget build(BuildContext context) {
    Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(
        children: [
          //Image(image: Image.network(meal.imageUrl)),
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        
        displayHeader('Ingredients'),


        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3),
          ),
          child: Card(
            child: ListView.builder(itemBuilder: ((context, index) =>
             Container(
              height: 10,
              child:const Card(color: Colors.amber,),
              )
             
             ),
          ),
        ),

          

        ],
      ),
    );
  }
}
