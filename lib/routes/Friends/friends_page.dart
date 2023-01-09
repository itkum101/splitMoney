import 'package:flutter/material.dart';

//Import Routes
import 'package:splitmoney/routes/Friends/add_friend.dart';
import 'package:splitmoney/routes/Friends/friends_page_display_list.dart';

//Import Widgets
import 'package:splitmoney/Widgets/app_bar_sample.dart';
//Import Utils
import 'package:splitmoney/utils/icon_button_sample.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    // Provider
    // var myfriendList = context.watch<FriendNameProvider>().friendList;
    // var myActivityList = context.watch<ActivityListProvider>().activities;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.green,
          icon: const Icon(Icons.add_rounded),
          label: const Text("Add Expense"),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarSample(
            actions: [
              IconButtonSample(onPressed: () {}, icon: Icons.search),
              const SizedBox(
                width: 7,
              ),
              IconButtonSample(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const AddFriend();
                    })));
                  },
                  icon: Icons.person_add_sharp)
            ],
          ),
        ),
        body: const FriendsPageDisplayList(
            // myfriendList: myfriendList,
            ));
  }
}
