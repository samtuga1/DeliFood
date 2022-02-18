import 'package:flutter/material.dart';
import '../dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static final String routeName = '/meal_detail_screen';
  const MealDetailScreen(this.toggleFavorites, this.isFavorite);
  final Function toggleFavorites;
  final Function isFavorite;
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    Widget _buildTitleSection(String title, BuildContext context) {
      return Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      );
    }

    Widget _buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
            color: Colors.white),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child,
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorites(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitleSection('Ingredients', context),
            _buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10),
                        child: Text('${selectedMeal.ingredients[index]}'),
                      ),
                    );
                  }),
            ),
            _buildTitleSection('Steps', context),
            _buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text('${selectedMeal.steps[index]}'),
                    ),
                    Divider(
                      thickness: 1.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
