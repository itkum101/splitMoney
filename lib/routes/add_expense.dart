import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Import utils
import 'package:splitmoney/utils/sample_elevated_button.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';

//Import Widgets
import 'package:splitmoney/widgets/alert_dialog_box.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';
import 'package:splitmoney/widgets/mini_container.dart';
import 'package:splitmoney/widgets/text_box.dart';

//Import models
import 'package:splitmoney/models/activity_model.dart';

//Import Provider
import 'package:splitmoney/provider/activity_list_provider.dart';

class AddExpense extends StatefulWidget {
  static const routeName = '/add_expense';
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final description = TextEditingController();

  final amount = TextEditingController();

  void tapped() {
    if (description.text.isEmpty || amount.text.isEmpty) {
      showDialog(
          context: context,
          builder: ((context) {
            return const AlertDialogBox(
                alertText: "Descriptin or amount cannot be empty!");
          }));
    } else {
      Provider.of<ActivityListProvider>(context, listen: false)
          .addToActiviityList(ActivityList(
              netAmount: int.parse(amount.text),
              description: description.text));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // var activityList = context.watch<ActivityListProvider>().activities;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarSample(
          title: "Add an expense",
          leading: IconButtonSample(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icons.close),
          actions: [
            IconButtonSample(onPressed: tapped, icon: Icons.check),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                MiniContainer(
                  child: const Icon(Icons.list),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextBox(
                    controller: description,
                    isautoFocus: false,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "Enter Description",
                    cursorColor: Colors.grey[400],
                    cursorHeight: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                MiniContainer(
                  child: const Icon(Icons.currency_rupee_rounded),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextBox(
                    controller: amount,
                    isautoFocus: false,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "0.00",
                    cursorColor: Colors.grey[400],
                    cursorHeight: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Spacer(),
              Row(
                children: [
                  Text(
                    "Paid by  ",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500),
                  ),
                  const SampleElevatedButton(buttonText: "you")
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(
                    "split ",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500),
                  ),
                  const SampleElevatedButton(buttonText: "equally"),
                  const Text(' .'),
                ],
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
