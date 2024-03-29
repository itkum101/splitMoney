import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/models/group_model.dart';
import 'package:splitmoney/provider/friend_name_provider.dart';
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
import 'package:uuid/uuid.dart';

class Settingsargs {
  final Group? group;
  Settingsargs({this.group});
}

class AddExpense extends StatefulWidget {
  static const routeName = '/add_expense';
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final description = TextEditingController();

  final amount = TextEditingController();
  String? information;
  Friend? frienditem;
  List<Friend> informationList = [];
  List<TextEditingController> textController = [];
  List<double> amountInDouble = [];
  void DatafromFriendListSelector() async {
    final data =
        await Navigator.pushNamed(context, FriendListSelector.routeName);
    setState(() {
      information = data as String;

      frienditem = friends.firstWhere((element) => element.id == information);
    });
  }

  void DatafromGroupFriendListSelector() async {
    final data1 =
        await Navigator.pushNamed(context, FriendListGroupSelector.routeName);
    setState(() {
      informationList = data1 as List<Friend>;
      textController = List.generate(
        informationList.length,
        (i) => TextEditingController(),
      );

      print(textController[0].text);
      print(informationList);
    });
  }

  Map<Friend, double> makeMap(List<Friend> x, List<double> y) {
    Map<Friend, double> tempData = {};
    for (int i = 0; i < x.length; i++) {
      tempData.addAll({x[i]: y[i]});
    }
    return tempData;
  }

  void tapped(Group groupName) {
    for (int i = 0; i < textController.length; i++) {
      amountInDouble.add(double.parse(textController[i].text));
    }
    if (description.text.isEmpty || amount.text.isEmpty) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialogBox(
                alertText: "Description or amount cannot be empty!");
          }));
    } else {
      Provider.of<ActivityListProvider>(context, listen: false)
          .addToActiviityList(
        Activity(
            id: const Uuid().v1(),
            paidBy: frienditem != null ? frienditem! : friends[0],
            netAmount: int.parse(amount.text),
            description: description.text,
            involvedFriend: informationList,
            involvedGroup: groupName,
            amountEachFriendSpent: makeMap(informationList, amountInDouble)),
      );
      friends.forEach((element) {
        element.isSelected = false;
      });
      print(makeMap(informationList, amountInDouble));
      context.read<FriendNameProvider>().calculate();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Settingsargs;

    // var activityList = context.watch<ActivityListProvider>().activities;
    print("THIS IS INFORMATION LIST");
    // print(textController[0].text);
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
              icon: Icons.arrow_back),
          actions: [
            IconButtonSample(
                onPressed: () {
                  tapped(args.group!);
                },
                icon: Icons.check),
            const SizedBox(width: 7)
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
                  child: const Icon(Icons.info),
                ),
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
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                width: 1, color: Colors.grey.shade400),
                          ),
                        ),
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        elevation: MaterialStateProperty.all(3),
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
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                width: 1, color: Colors.grey.shade400),
                          ),
                        ),
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        elevation: MaterialStateProperty.all(3),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {
                      DatafromGroupFriendListSelector();
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
          ),
          const SizedBox(height: 10),
          informationList.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: informationList.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        leading: const Icon(Icons.person),
                        selectedTileColor: Colors.red,
                        title: Text(informationList[index].friendName),
                        trailing: SizedBox(
                          width: 45,
                          child: TextField(
                            controller: textController[index],
                          ),
                        ),
                      );
                    }),
                  ),
                )
              : const Text("NONE SELECTED"),
        ],
      ),
    );
  }
}
