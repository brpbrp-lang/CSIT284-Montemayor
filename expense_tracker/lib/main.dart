import 'package:flutter/material.dart';

import 'models/expense.dart';
import 'theme/app_theme.dart';
import 'widgets/expenses.dart';

void main() {
  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: appTheme,
      home: const ExpenseTrackerHome(),
    );
  }
}

class ExpenseTrackerHome extends StatelessWidget {
  const ExpenseTrackerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = [
      Expense(
        title: 'Lunch',
        amount: 150.00,
        date: DateTime(2026, 9, 29),
        category: Category.food,
      ),
      Expense(
        title: 'Bus Fare',
        amount: 50.00,
        date: DateTime(2026, 9, 28),
        category: Category.transportation,
      ),
      Expense(
        title: 'School Supplies',
        amount: 350.00,
        date: DateTime(2026, 9, 27),
        category: Category.education,
      ),
      Expense(
        title: 'Electricity Bill',
        amount: 980.00,
        date: DateTime(2026, 9, 25),
        category: Category.bills,
      ),
    ];

    return Expenses(
      expenses: expenses,
    );
  }
}