import 'package:flutter/material.dart';
import 'package:splitmoney/utils/add_friend_display_list.dart.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({super.key});

  @override
  State<AddFriend> createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: const AddFriendDisplayList()
      ),
    );
  }
}
