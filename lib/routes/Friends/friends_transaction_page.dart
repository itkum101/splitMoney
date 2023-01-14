import 'package:flutter/material.dart';
import 'package:splitmoney/data/friend_data.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';
import 'package:splitmoney/utils/mini_heading_text.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';

class FriendsTransactionPage extends StatelessWidget {
  const FriendsTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarSample(
          actions: [
            IconButtonSample(onPressed: () {}, icon: Icons.search),
            const SizedBox(width: 7),
            IconButtonSample(onPressed: () {}, icon: Icons.group_add),
            const SizedBox(width: 7)
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            child: const Text(
              "WHO OWNS WHAT",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 21,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: MiniHeadingText(text: friends[index].friendName),
                    leading: Icon(Icons.person),
                    trailing: Text(
                      friends[index].netAmount.toString(),
                      style: TextStyle(
                        color: friends[index].netAmount > 0
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
