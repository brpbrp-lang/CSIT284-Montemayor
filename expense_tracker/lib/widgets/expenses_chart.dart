import 'package:flutter/material.dart';

import '../data/categories.dart';
import '../models/expense.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    final categoryTotals = <Category, double>{};

    for (final expense in expenses) {
      categoryTotals[expense.category] =
          (categoryTotals[expense.category] ?? 0) + expense.amount;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spending Overview',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            for (final category in Category.values)
              _CategoryRow(
                category: category,
                amount: categoryTotals[category] ?? 0,
              ),
          ],
        ),
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({
    required this.category,
    required this.amount,
  });

  final Category category;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final categoryData = categories[category]!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(categoryData.icon),
          const SizedBox(width: 12),
          Expanded(
            child: Text(categoryData.label),
          ),
          Text(
            '₱${amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}