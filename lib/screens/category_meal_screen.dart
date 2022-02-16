import 'package:flutter/material.dart';
import '../dummy-data.dart';

class CategoryMealScreen extends StatelessWidget {
  static final String routeName = '/category_meal';
  // final String? mealId;
  // final String mealTitle;
  // const CategoryMealScreen(
  //     {Key? key, required this.mealId, required this.mealTitle})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Center(child: Text(categoryMeals[index].title));
          },
          itemCount: categoryMeals.length,
        ));
  }
}
