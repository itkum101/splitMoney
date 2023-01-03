import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:splitmoney/Widgets/text_field.dart';
import 'package:splitmoney/routes/add_a_contact.dart';

class AddFriend extends StatelessWidget {
  const AddFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextBoxSample(
                    isautoFocus: true,
                    hintText: "Enter name or phone no.",
                    border: InputBorder.none,
                    cursorColor: Colors.grey[600],
                    cursorHeight: 21,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 13,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddContact();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green[100],
                  child: Icon(
                    Icons.person_add_outlined,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Text(
                  "Add a new Contact",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ))
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "From your contacts",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w900,
                      fontSize: 11),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
