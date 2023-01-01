import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:splitmoney/Widgets/text_field.dart';

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
          )
        ],
      ),
    );
  }
}
