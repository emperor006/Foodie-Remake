import 'package:flutter/material.dart';

import '../Models/meal.dart';

class MealsItem extends StatelessWidget {
  //const MealsItem({ Key? key }) : super(key: key);

  Meal meal;
  MealsItem(this.meal);

  String getComplexity(Meal meal) {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  String getAffordability(Meal meal) {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Cheap';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 3,
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  meal.imageUrl,
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 15,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(13, 5, 10, 5),
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.4)),
                    child: Text(
                      meal.title,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            ]),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.history),
                      SizedBox(
                        width: 7,
                      ),
                      Text('${meal.duration} mins')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 7,
                      ),
                      Text(getComplexity(meal))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(
                        width: 7,
                      ),
                      Text(getAffordability(meal))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
