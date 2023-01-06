import 'package:flutter/material.dart';

class FriendTile extends StatelessWidget {
  final String friendName;
  final String friendEmail;
  final double netAmount;
  final Widget? imgChild;
  void Function()? onTap;

  FriendTile({
    super.key,
    required this.friendName,
    required this.friendEmail,
    required this.onTap,
    required this.imgChild,
    this.netAmount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 22,
        child: imgChild,
      ),
      title: Text(
        friendName,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 15, color: Colors.grey[800]),
      ),
      subtitle: Text(friendEmail),
      trailing: Text(
        netAmount.toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.green[300]),
      ),
    );
  }
}
