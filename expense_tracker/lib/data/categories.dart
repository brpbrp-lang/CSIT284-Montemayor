import 'package:flutter/material.dart';

import '../models/expense.dart';

class CategoryData {
  const CategoryData({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

final categories = <Category, CategoryData>{
  Category.food: const CategoryData(
    label: 'Food',
    icon: Icons.restaurant,
  ),
  Category.transportation: const CategoryData(
    label: 'Transportation',
    icon: Icons.directions_bus,
  ),
  Category.education: const CategoryData(
    label: 'Education',
    icon: Icons.school,
  ),
  Category.entertainment: const CategoryData(
    label: 'Entertainment',
    icon: Icons.sports_esports,
  ),
  Category.bills: const CategoryData(
    label: 'Bills',
    icon: Icons.lightbulb,
  ),
  Category.other: const CategoryData(
    label: 'Other',
    icon: Icons.category,
  ),
};