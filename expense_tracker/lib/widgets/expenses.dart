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

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${expense.title} added successfully',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${expense.title} deleted',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _openAddExpense() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: NewExpense(
            onAddExpense: _addExpense,
          ),
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
            Text(
              'My Expenses',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'September 2026',
              style: TextStyle(
                fontSize: 13,
              ),
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
                      onRemoveExpense: _removeExpense,
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
              onRemoveExpense: _removeExpense,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddExpense,
        icon: const Icon(Icons.add),
        label: const Text('Add Expense'),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({
    required this.expenses,
    required this.totalAmount,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final double totalAmount;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'TOTAL SPENDING',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0,
                    end: totalAmount,
                  ),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return Text(
                      '₱${value.toStringAsFixed(2)}',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                    );
                  },
                ),
                const SizedBox(height: 4),
                Text(
                  'This Month',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ExpensesChart(
            expenses: expenses,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recent Expenses',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ExpensesList(
              expenses: expenses,
              onRemoveExpense: onRemoveExpense,
            ),
          ),
        ),
      ],
    );
  }
}