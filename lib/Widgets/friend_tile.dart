import 'package:flutter/material.dart';
import 'package:splitmoney/models/friend_model.dart';

class FriendTile extends StatelessWidget {
  Friend friend;
  final double netmount;
  void Function()? onTap;

  FriendTile({
    super.key,
    required this.friend,
     this.netmount=0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 22,
        child: friend.imgChild,
      ),
      title: Text(
        friend.friendName,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 15, color: Colors.grey[800]),
      ),
      subtitle: Text(friend.friendEmail),
      trailing: Text(
       netmount.toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.green[300]),
      ),
    );
  }
}
