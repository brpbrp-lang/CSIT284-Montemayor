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

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 350;
        final isWide = constraints.maxWidth >= 600;

        final chartPadding = isNarrow ? 10.0 : 16.0;
        final rowSpacing = isNarrow ? 10.0 : 16.0;
        final iconSize = isNarrow ? 20.0 : 24.0;

        return Card(
          child: Padding(
            padding: EdgeInsets.all(chartPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Spending Overview',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: isNarrow ? 18 : null,
                      ),
                ),
                SizedBox(height: isNarrow ? 10 : 16),

                for (final category in Category.values)
                  _CategoryRow(
                    category: category,
                    amount: categoryTotals[category] ?? 0,
                    totalAmount: totalAmount,
                    rowSpacing: rowSpacing,
                    iconSize: iconSize,
                    isWide: isWide,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({
    required this.category,
    required this.amount,
    required this.totalAmount,
    required this.rowSpacing,
    required this.iconSize,
    required this.isWide,
  });

  final Category category;
  final double amount;
  final double totalAmount;
  final double rowSpacing;
  final double iconSize;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final categoryData = categories[category]!;

    final percentage =
        totalAmount == 0 ? 0.0 : amount / totalAmount;

    return Padding(
      padding: EdgeInsets.only(bottom: rowSpacing),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                categoryData.icon,
                size: iconSize,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  categoryData.label,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: isWide ? 16 : null,
                  ),
                ),
              ),
              const SizedBox(width: 8),
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