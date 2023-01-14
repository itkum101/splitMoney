import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/data/friend_data.dart';
import 'package:splitmoney/models/friend_model.dart';
import 'package:splitmoney/provider/friend_name_provider.dart';

class FriendTile extends StatelessWidget {
  Friend friend;
  final double netmount;
  void Function()? onTap;

  FriendTile({
    super.key,
    required this.friend,
    this.netmount = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // context.watch<FriendNameProvider>().amountToPayOrReceive();
    // context.watch<FriendNameProvider>().calculate(friend);
    if (friends[0] != friend) {
      context.read<FriendNameProvider>().calculate(friend);
    }
    var tempdata = context.watch<FriendNameProvider>().amounts2;

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
        friends[0] != friend ? tempdata.toString() : "0.000",
        // context.read<FriendNameProvider>().amounts.toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.green[300]),
      ),
    );
  }
}
