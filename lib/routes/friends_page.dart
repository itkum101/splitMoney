import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/Widgets/friend_tile.dart';
import 'package:splitmoney/utils/data.dart';
import 'package:splitmoney/routes/add_friend.dart';
import 'package:splitmoney/utils/friends_page_display_list.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    // Provider
    var myfriendList = context.watch<FriendNameProvider>().friendList;
    var myActivityList = context.watch<ActivityListProvider>().activities;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.green,
          icon: const Icon(Icons.add_rounded),
          label: const Text("Add Expense"),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                splashRadius: 20,
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  size: 23,
                  color: Colors.grey[800],
                )),
            const SizedBox(
              width: 7,
            ),
            IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const AddFriend();
                  })));
                },
                icon: Icon(
                  Icons.person_add_sharp,
                  size: 23,
                  color: Colors.grey[800],
                )),
            const SizedBox(
              width: 17,
            ),
          ],
        ),
        body: FriendsPageDisplayList(
          myfriendList: myfriendList,
        ));
  }
}
