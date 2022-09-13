import 'package:flutter/material.dart';

import '../Widget/drawer.dart';

class Filter extends StatefulWidget {
  //const Filter({ Key? key }) : super(key: key);
  static const routeName = '/filter';

  Map<String, bool> map;
  Function updatePreference;

  Filter(this.map, this.updatePreference);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isGlutenFree = false;


  @override
  void didChangeDependencies() {
    _isGlutenFree = widget.map['isGlutenFree'] as bool;
    _isVegan = widget.map['isVegan'] as bool;
    _isVegetarian = widget.map['isVegetarianFree'] as bool;
    _isLactoseFree = widget.map['isLactoseFree'] as bool;

    super.didChangeDependencies();
  }

  Widget buildListTile(bool value, String title, String subTitle, var _func) {
    return SwitchListTile(
      value: value,
      onChanged: _func,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30, left: 30),
            child: GestureDetector(
                onTap: () {
                  widget.updatePreference({
                    'isVegan':_isVegan,
                    'isLactoseFree':_isLactoseFree,
                    'isVegetarianFree':_isVegetarian,
                    'isGlutenFree':_isGlutenFree
                  });



                },
                child: Icon(Icons.save)),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 14, bottom: 10),
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Adjust your meal selection here!',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          buildListTile(_isGlutenFree, 'Gluten-free',
              'Only include gluten-free meals', (val) {
            setState(() {
            _isGlutenFree = val;
            });
            //  widget.updatePreference(widget.map);
          }),
          buildListTile(_isVegan, 'Vegan', 'Only include vegan meals',
              (val) {
            setState(() {
              _isVegan = val;
            });
            // widget.updatePreference(widget.map);
          }),
          buildListTile(_isLactoseFree, 'Lactose-free',
              'Only include lactose-free meals', (val) {
            setState(() {
              _isLactoseFree = val;
            });
            // widget.updatePreference(widget.map);
          }),
          buildListTile(_isVegetarian, 'Vegetarian-free',
              'Only include vegetarian-free meals', (val) {
            setState(() {
              _isVegetarian = val;
            });
            //      widget.updatePreference(widget.map);
          }),
        ],
      ),
    );
  }
}
