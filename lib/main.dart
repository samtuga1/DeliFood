import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../meal.dart';
import '../screens/category_meal_screen.dart';
import '../screens/filter_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tab_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetables': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetables'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> availableMeals = DUMMY_MEALS;
  late List<Meal>? favoriteMeals;
  void _toggleFavorites(String mealId) {
    int existingIndex = favoriteMeals!.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals!.removeAt(existingIndex);
      });
    } else if (existingIndex < 0) {
      setState(() {
        favoriteMeals!.firstWhere((meal) => meal.id == mealId);
      });
    }
  }

  bool _isFavoriteMeal(id) {
    return favoriteMeals!.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
                  fontSize: 20,
                  // fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoriteMeals: this.favoriteMeals),
        FilterScreen.routeName: (context) => FilterScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorites, _isFavoriteMeal),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
