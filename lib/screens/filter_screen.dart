import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static final String routeName = '/filter_screen';
  const FilterScreen({Key? key, this.saveFilters, this.currentFilters})
      : super(key: key);
  final Map<String, dynamic>? currentFilters;
  final Function? saveFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters!['gluten'];
    _isVegan = widget.currentFilters!['vegan'];
    _isVegetarian = widget.currentFilters!['vegetables'];
    _isLactoseFree = widget.currentFilters!['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetables': _isVegetarian,
              };
              widget.saveFilters!(selectedFilters);
            },
          ),
        ],
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
