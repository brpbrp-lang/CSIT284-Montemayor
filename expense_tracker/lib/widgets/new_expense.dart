import 'package:flutter/material.dart';

import '../data/categories.dart';
import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category? _selectedCategory;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _presentDatePicker() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _saveExpense() {
    final enteredTitle = _titleController.text.trim();
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        _selectedCategory == null ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
              'Please enter a valid title, amount, category, and date.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      return;
    }

    final expense = Expense(
      title: enteredTitle,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory!,
    );

    widget.onAddExpense(expense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Expense',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Expense Title',
                hintText: 'e.g. Lunch',
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '₱ ',
              ),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<Category>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
              items: Category.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(categories[category]!.label),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : 'Date: ${_selectedDate!.month}/'
                            '${_selectedDate!.day}/'
                            '${_selectedDate!.year}',
                  ),
                ),
                TextButton.icon(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('Select Date'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('CANCEL'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _saveExpense,
                  child: const Text('SAVE EXPENSE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}