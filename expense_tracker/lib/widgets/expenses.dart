import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expenses_chart.dart';
import 'expenses_list.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  late List<Expense> _registeredExpenses;

  @override
  void initState() {
    super.initState();

    _registeredExpenses = List.from(widget.expenses);
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Expense added successfully'),
      ),
    );
  }

  void _openAddExpense() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      },
    );
  }

  double get totalAmount {
    return _registeredExpenses.fold(
      0.0,
      (sum, expense) => sum + expense.amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Expenses'),
            Text(
              'September 2026',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpense,
            icon: const Icon(Icons.add),
            tooltip: 'Add expense',
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 700) {
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _DashboardContent(
                      expenses: _registeredExpenses,
                      totalAmount: totalAmount,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ExpensesChart(
                        expenses: _registeredExpenses,
                      ),
                    ),
                  ),
                ],
              );
            }

            return _DashboardContent(
              expenses: _registeredExpenses,
              totalAmount: totalAmount,
            );
          },
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({
    required this.expenses,
    required this.totalAmount,
  });

  final List<Expense> expenses;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOTAL SPENDING',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₱${totalAmount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(height: 4),
                  const Text('This Month'),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ExpensesChart(
            expenses: expenses,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recent Expenses',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ExpensesList(
              expenses: expenses,
            ),
          ),
        ),
      ],
    );
  }
}