
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

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CategoriesScreen(),

      onGenerateRoute: (settings) {
        if (settings.name == '/meal-details') {
          final meal = settings.arguments as Meal;

          return MaterialPageRoute(
            builder: (ctx) => MealDetailsScreen(meal: meal),
          );
        }

        return null;
      },
    );
  }
}
