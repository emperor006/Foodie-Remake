import 'package:flutter/material.dart';

class MealsItem extends StatelessWidget {
  //const MealsItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 320,
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
                  'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 15,
                right: 10,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    
                    color: Color.fromARGB(255, 132, 130, 130)),
                child: const Text(
                  'Wiener Schnitzel',
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
              )),
            ]),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(
                        width: 7,
                      ),
                      Text('Cheap')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(
                        width: 7,
                      ),
                      Text('Cheap')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(
                        width: 7,
                      ),
                      Text('Cheap')
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
