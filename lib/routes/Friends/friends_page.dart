import 'package:flutter/material.dart';

//Import Routes
import 'package:splitmoney/routes/Friends/add_friend.dart';
import 'package:splitmoney/routes/Friends/friends_page_display_list.dart';

//Import Widgets
import 'package:splitmoney/widgets/app_bar_sample.dart';
//Import Utils
import 'package:splitmoney/utils/icon_button_sample.dart';
import 'package:splitmoney/utils/sample_floating_action_button.dart';

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
        floatingActionButton: const SampleFloatingActionButton(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarSample(
            actions: [
              IconButtonSample(onPressed: () {}, icon: Icons.search),
              const SizedBox(width: 7),
              IconButtonSample(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const AddFriend();
                    })));
                  },
                  icon: Icons.person_add_sharp),
              const SizedBox(width: 7)
            ],
          ),
        ),
        body: const FriendsPageDisplayList(
            // myfriendList: myfriendList,
            ));
  }
}
