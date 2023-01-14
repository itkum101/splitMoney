import 'package:flutter/material.dart';
import 'package:splitmoney/models/group_model.dart';
import 'package:splitmoney/routes/add_expense.dart';

class SampleFloatingActionButton extends StatelessWidget {
  final Group group;
  const SampleFloatingActionButton({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, AddExpense.routeName,
            arguments: Settingsargs(group: group));
      },
      backgroundColor: Colors.green,
      icon: const Icon(Icons.add_rounded),
      label: const Text("Add Expense"),
    );
  }
}
