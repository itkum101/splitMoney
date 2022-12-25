import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Hero(
        tag: 0,
        child: CircleAvatar(
          backgroundColor: Colors.red,
        ),
      ),
      title: const Text("Mark ZUCK"),
      subtitle: const Text("zuck@fb.com"),
      trailing: Column(
        children: const [
          SizedBox(
            height: 8,
          ),
          Text("Rs. 30"),
        ],
      ),
    );
  }
}
