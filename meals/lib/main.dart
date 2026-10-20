
import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/models/meal.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    setState(() {
      if (isExisting) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: CategoriesScreen(
        favoriteMeals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/meal-details') {
          final meal = settings.arguments as Meal;

          return MaterialPageRoute<bool>(
            builder: (ctx) => MealDetailsScreen(
              meal: meal,
              isFavorite: _favoriteMeals.contains(meal),
              onToggleFavorite: _toggleMealFavoriteStatus,
            ),
          );
        }

        return null;
      },
    );
  }
}
