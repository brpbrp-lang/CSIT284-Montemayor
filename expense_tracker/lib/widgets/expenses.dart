import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expenses_content.dart';
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
        content: Text('${expense.title} added successfully'),
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
        content: Text('${expense.title} deleted'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _openAddExpense() {
    showDialog(
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;

        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width > 600 ? 600 : width * 0.95,
            ),
            child: NewExpense(
              onAddExpense: _addExpense,
            ),
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
              'Track your spending',
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
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: ExpensesContent(
          expenses: _registeredExpenses,
          totalAmount: totalAmount,
          onRemoveExpense: _removeExpense,
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          final width = MediaQuery.of(context).size.width;

          if (width < 400) {
            return FloatingActionButton(
              onPressed: _openAddExpense,
              tooltip: 'Add expense',
              child: const Icon(Icons.add),
            );
          }

          return FloatingActionButton.extended(
            onPressed: _openAddExpense,
            icon: const Icon(Icons.add),
            label: const Text('Add Expense'),
          );
        },
      ),
    );
  }
}