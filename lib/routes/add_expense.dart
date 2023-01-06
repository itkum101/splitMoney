import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/Widgets/text_box.dart';
import 'package:splitmoney/utils/data.dart';

class AddExpense extends StatelessWidget {
  static const routeName = '/add_expense';
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    // var activityList = context.watch<ActivityListProvider>().activities;
    final description = TextEditingController();
    final amount = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Add an expense",
        ),
        leading: IconButton(
            splashRadius: 20,
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(
              Icons.close,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                splashRadius: 20,
                onPressed: () {
                  print("HELLO WORLD");
                  print(description.text);
                  print(int.parse(amount.text));

                  // context.read<ActivityListProvider>().addToActiviityList(
                  //       ActivityList(
                  //         description: description.text,
                  //         netAmount: int.parse(amount.text),
                  //       ),
                  //     );
                  Provider.of<ActivityListProvider>(context, listen: false)
                      .addToActiviityList(ActivityList(
                          netAmount: int.parse(amount.text),
                          description: description.text));
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check)),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[700],
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
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.list)),
                const SizedBox(
                  width: 10,
                ),
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
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.currency_rupee_rounded)),
                const SizedBox(
                  width: 10,
                ),
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
                    onPressed: () {},
                    child: Text(
                      "you",
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              const SizedBox(
                width: 20,
              ),
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
                    onPressed: () {},
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
