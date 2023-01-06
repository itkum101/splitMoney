import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/Widgets/text_box.dart';
import 'package:splitmoney/utils/data.dart';

class AddContact extends StatefulWidget {
  AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final phoneNoController = TextEditingController();

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var myList = context.watch<FriendNameProvider>().friendList;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Add a new contact",
            ),
          ),
          leading: IconButton(
              splashRadius: 20,
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: const Icon(
                Icons.arrow_back_rounded,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    context.read<FriendNameProvider>().addToGroupList(
                        FriendList(
                            friendEmail: "random@gmail.com",
                            friendName: nameController.text,
                            imgChild: Icon(Icons.person)));

                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.check)),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[700],
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
          const SizedBox(
            height: 20,
          ),
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Fill up the information and click on the okay button at the top right corner",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ))
        ]));
  }
}
