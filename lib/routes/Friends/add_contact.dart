import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Import model
import 'package:splitmoney/models/friend_model.dart';

//Import Provider
import 'package:splitmoney/provider/friend_name_provider.dart';
//import utils
import 'package:splitmoney/utils/icon_button_sample.dart';

//Import Widgets
import 'package:splitmoney/widgets/alert_dialog_box.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';
import 'package:splitmoney/widgets/info_text_row.dart';
import 'package:splitmoney/widgets/text_box.dart';
import 'package:uuid/uuid.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  var uuid = const Uuid();
  void tapped() {
    if (nameController.text.isEmpty || phoneNoController.text.isEmpty) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialogBox(
                alertText: "Name or Phone.no cannot be empty!");
          }));
    } else {
      Provider.of<FriendNameProvider>(context, listen: false).addToFriendList(
          FriendList(
              id: uuid.v1(),
              friendName: nameController.text,
              friendEmail: "random@gmail.com",
              imgChild: const Icon(Icons.person)));
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  final phoneNoController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var myList = context.watch<FriendNameProvider>().friendList;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarSample(
            title: "Add a new contact",
            leading: IconButtonSample(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icons.arrow_back_rounded),
            actions: [
              IconButtonSample(onPressed: tapped, icon: Icons.check),
              const SizedBox(width: 7)
            ],
          ),
        ),
        body: Column(children: [
          Container(
            height: 1,
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextBox(
              controller: nameController,
              isautoFocus: false,
              isFilled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: "Name",
              cursorColor: Colors.grey[400],
              cursorHeight: 20,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextBox(
              controller: phoneNoController,
              isautoFocus: false,
              isFilled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: "Phone number",
              cursorColor: Colors.grey[400],
              cursorHeight: 20,
            ),
          ),
          const SizedBox(height: 20),
          InfoTextRow(
              icon: Icons.info_rounded,
              infoText:
                  "Fill up the information and click on the okay button at the top right corner")
        ]));
  }
}
