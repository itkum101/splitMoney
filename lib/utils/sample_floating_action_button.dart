import 'package:flutter/material.dart';
import 'package:splitmoney/routes/add_expense.dart';

class SampleFloatingActionButton extends StatelessWidget {
  const SampleFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AddExpense.routeName);
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add_rounded),
        label: const Text("Add Expense"),
      );
  }
}