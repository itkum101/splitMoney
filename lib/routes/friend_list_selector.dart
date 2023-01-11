import 'package:flutter/material.dart';
import 'package:splitmoney/data/friend_data.dart';

class FriendListSelector extends StatelessWidget {
  static const routeName = '/friend_list_selector';
  const FriendListSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Select who pays ",
            style: TextStyle(fontSize: 15),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: friends.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListTile(
                    selectedTileColor: Colors.green,
                    onTap: () {
                      Navigator.pop(context, friends[index].id);
                    },
                    leading: CircleAvatar(
                      radius: 22,
                      child: const Icon(Icons.person),
                    ),
                    title: Text(friends[index].friendName),
                    subtitle: Text(friends[index].friendEmail),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
