import 'package:flutter/material.dart';

class FriendTile extends StatelessWidget {
  final String friendName;
  final String friendEmail;
  const FriendTile(
      {super.key, required this.friendName, required this.friendEmail});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.green,
      ),
      title: Text(
        friendName,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 15, color: Colors.grey[700]),
      ),
      subtitle: Text(friendEmail),
      trailing: Text(
        "Rs. 30",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.green[300]),
      ),
    );
  }
}
