import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static final String routeName = '/filter_screen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = true;
  var _isVegetarian = true;
  var _isLactoseFree = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.subtitle1),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                    title: Text('Gluten Free'),
                    subtitle: Text('Only include gluten-free meals'),
                    value: _isGlutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Vegan'),
                    subtitle: Text('Only include Vegan meals'),
                    value: _isVegan,
                    onChanged: (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Vegetables'),
                    subtitle: Text('Only include vegetable meals'),
                    value: _isVegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Lactose-free'),
                    subtitle: Text('Only include lactose-free meals'),
                    value: _isLactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
