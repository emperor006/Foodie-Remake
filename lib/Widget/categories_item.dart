import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  //const CategoriesItem({Key? key}) : super(key: key);
  final Color color;
  final String title;

 const CategoriesItem(this.color, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color
          ),
        child: Center(child: Text(title, style:const TextStyle(fontSize: 20),),),
      ),
    );
  }
}
