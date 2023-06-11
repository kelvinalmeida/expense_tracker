import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.onRenmoveExpense,
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRenmoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) => onRenmoveExpense(expenses[index]),
          child: ExpenseItem(
            expenses[index],
          )),
    );
  }
}
