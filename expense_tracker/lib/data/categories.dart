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

const categories = {
  Category.food: CategoryData(
    label: 'Food',
    icon: Icons.restaurant,
  ),
  Category.transportation: CategoryData(
    label: 'Transportation',
    icon: Icons.directions_bus,
  ),
  Category.education: CategoryData(
    label: 'Education',
    icon: Icons.school,
  ),
  Category.entertainment: CategoryData(
    label: 'Entertainment',
    icon: Icons.sports_esports,
  ),
  Category.bills: CategoryData(
    label: 'Bills',
    icon: Icons.lightbulb,
  ),
  Category.other: CategoryData(
    label: 'Other',
    icon: Icons.category,
  ),
};