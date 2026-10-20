
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.favoriteMeals,
  });

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (favoriteMeals.isEmpty) {
      content = const Center(
        child: Text(
          'You have no favorite meals yet.',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      body: content,
    );
  }
}
