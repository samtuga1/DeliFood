import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

import '../meal.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);
  final List<Meal>? favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals!.isEmpty) {
      return Center(
        child: Text('Favorites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: favoriteMeals![index].title,
            imageUrl: favoriteMeals![index].imageUrl,
            duration: favoriteMeals![index].duration,
            complexity: favoriteMeals![index].complexity,
            affordability: favoriteMeals![index].affordability,
            id: favoriteMeals![index].id,
          );
        },
        itemCount: favoriteMeals!.length,
      );
    }
  }
}
