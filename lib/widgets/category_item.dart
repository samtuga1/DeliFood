import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String title;
  final Color color;
  const CategoryItem(
      {Key? key, required this.title, required this.color, this.id})
      : super(key: key);

  _selectEvent(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectEvent(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
