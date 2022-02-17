import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static final String routeName = '/filter_screen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('Filter Screen'),
      ),
    );
  }
}
