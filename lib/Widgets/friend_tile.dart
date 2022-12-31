import 'package:flutter/material.dart';

class FriendTile extends StatelessWidget {
  final String friendName;
  final String friendEmail;
  void Function()? onTap;

   FriendTile(
      {super.key, required this.friendName, required this.friendEmail, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.green,
      ),
      title: Text(
        friendName,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 15, color: Colors.grey[800]),
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
