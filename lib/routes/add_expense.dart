import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';

//Import Widgets
import 'package:splitmoney/widgets/alert_dialog_box.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';
import 'package:splitmoney/widgets/mini_container.dart';
import 'package:splitmoney/widgets/text_box.dart';
import 'package:splitmoney/data/friend_data.dart';

//Import models
import 'package:splitmoney/models/activity_model.dart';
import 'package:splitmoney/models/friend_model.dart';

//Import Provider
import 'package:splitmoney/provider/activity_list_provider.dart';
import 'package:splitmoney/routes/Groups/friend_list_group_selector.dart';
import 'package:splitmoney/routes/friend_list_selector.dart';

class AddExpense extends StatefulWidget {
  static const routeName = '/add_expense';
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final description = TextEditingController();

  final amount = TextEditingController();
  String information = "you";
  FriendList? frienditem;

  void DatafromFriendListSelector() async {
    final data =
        await Navigator.pushNamed(context, FriendListSelector.routeName);
    setState(() {
      information = data.toString();

      frienditem = friends.firstWhere((element) => element.id == information);
    });
  }

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
                MiniContainer(child: const Icon(Icons.list)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextBox(
                    controller: description,
                    isautoFocus: false,
                    isFilled: true,
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
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                MiniContainer(
                  child: const Icon(Icons.currency_pound_rounded),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextBox(
                    controller: amount,
                    isautoFocus: false,
                    isFilled: true,
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
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
                  Text(
                    "Paid by  ",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {
                      DatafromFriendListSelector();
                    },
                    child: Text(
                      frienditem != null ? frienditem!.friendName : "you",
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              const SizedBox(width: 20),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
                  Text(
                    "split ",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        FriendListGroupSelector.routeName,
                      );
                    },
                    child: Text(
                      "equally",
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text(' .'),
                  // const Spacer()
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
