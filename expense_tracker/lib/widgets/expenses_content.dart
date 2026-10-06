import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expense_summary_card.dart';
import 'expenses_chart.dart';
import 'expenses_list.dart';

class ExpensesContent extends StatelessWidget {
  const ExpensesContent({
    super.key,
    required this.expenses,
    required this.totalAmount,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final double totalAmount;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            if (width >= 600) {
              return _buildTabletLayout(context);
            }

            if (orientation == Orientation.landscape) {
              return _buildLandscapePhoneLayout(context);
            }

            return _buildPortraitLayout(context);
          },
        );
      },
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ExpenseSummaryCard(
            totalAmount: totalAmount,
          ),
          const SizedBox(height: 12),
          ExpensesChart(
            expenses: expenses,
          ),
          const SizedBox(height: 12),
          _buildRecentExpensesTitle(context),
          const SizedBox(height: 8),
          Expanded(
            child: ExpensesList(
              expenses: expenses,
              onRemoveExpense: onRemoveExpense,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapePhoneLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ExpenseSummaryCard(
                    totalAmount: totalAmount,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ExpensesChart(
                        expenses: expenses,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _buildRecentExpensesTitle(context),
          const SizedBox(height: 8),
          Expanded(
            child: ExpensesList(
              expenses: expenses,
              onRemoveExpense: onRemoveExpense,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ExpenseSummaryCard(
                      totalAmount: totalAmount,
                    ),
                    const SizedBox(height: 12),
                    _buildRecentExpensesTitle(context),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ExpensesList(
                        expenses: expenses,
                        onRemoveExpense: onRemoveExpense,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ExpensesChart(
                      expenses: expenses,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentExpensesTitle(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Recent Expenses',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}