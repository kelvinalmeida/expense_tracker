import 'package:expense_tracker/widgets/expenses/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Couse',
      amount: 11.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Theater',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAllExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        listOfExpenses: _registeredExpenses,
        addNewExpense: addNewExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter ExpenseTracker'), actions: [
        IconButton(
          onPressed: _openAllExpenseOverlay,
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(children: [
        const Text('The chart...'),
        Expanded(child: ExpensesList(expenses: _registeredExpenses)),
      ]),
    );
  }
}
