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

    final totalAmount = expenses.fold(
      0.0,
      (sum, expense) => sum + expense.amount,
    );

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
                totalAmount: totalAmount,
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
    required this.totalAmount,
  });

  final Category category;
  final double amount;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    final categoryData = categories[category]!;

    final percentage = totalAmount == 0
        ? 0.0
        : amount / totalAmount;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Icon(categoryData.icon),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  categoryData.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '₱${amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          LinearProgressIndicator(
            value: percentage,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),

          const SizedBox(height: 4),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${(percentage * 100).toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}