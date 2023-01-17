import 'package:flutter/material.dart';

import 'package:splitmoney/data/friend_data.dart';
import 'package:splitmoney/models/friend_model.dart';


class FriendTile extends StatefulWidget {
  Friend friend;
  final double netAmount;
  void Function()? onTap;

  FriendTile({
    super.key,
    required this.friend,
    this.netAmount = 0,
    required this.onTap,
  });

  @override
  State<FriendTile> createState() => _FriendTileState();
}

class _FriendTileState extends State<FriendTile> {
  @override
  Widget build(BuildContext context) {
    // context.watch<FriendNameProvider>().amountToPayOrReceive();
    // context.watch<FriendNameProvider>().calculate(friend);
    // if (friends[0] != friend) {
    //   context.read<FriendNameProvider>().calculate(friend);
    // }
    // var tempdata = context.watch<FriendNameProvider>().amounts2;

    return ListTile(
      onTap: widget.onTap,
      leading: CircleAvatar(
        radius: 22,
        child: widget.friend.imgChild,
      ),
      title: Text(
        widget.friend.friendName,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 15, color: Colors.grey[800]),
      ),
      subtitle: Text(widget.friend.friendEmail),
      trailing: Text(
        friends[0] != widget.friend ? widget.friend.netAmount.toString() : "0",
        // context.read<FriendNameProvider>().amounts.toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: widget.friend.netAmount>=0?Colors.green[300]:Colors.red),
      ),
    );
  }
}
