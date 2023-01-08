import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/provider/activity_list_provider.dart';
import 'package:splitmoney/provider/friend_name_provider.dart';
import '../Widgets/friend_tile.dart';

class FriendsPageDisplayList extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  // final myfriendList;
  const FriendsPageDisplayList({super.key});

  @override
  State<FriendsPageDisplayList> createState() => _FriendsPageDisplayListState();
}

class _FriendsPageDisplayListState extends State<FriendsPageDisplayList> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // var myActivityList = context.watch<ActivityListProvider>().activities;
    var amounts = Provider.of<ActivityListProvider>(context, listen: false)
        .returnTotalAmount();
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey[400],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Overall, You are owned",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    " Rs.316.24",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.green[300]),
                  ),
                ],
              ),
              IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: Icon(
                    Icons.dashboard_customize_rounded,
                    size: 27,
                    color: Colors.grey[900],
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(child:
            Consumer<FriendNameProvider>(builder: ((context, value, child) {
          return ListView.builder(
              itemCount: value.friendList.length,
              itemBuilder: ((context, index) {
                return FriendTile(
                  friendName: value.friendList[index].friendName,
                  friendEmail: value.friendList[index].friendEmail,
                  netAmount: amounts / (value.friendList.length),
                  imgChild: value.friendList[index].imgChild,
                  onTap: () {},
                );
              }));
        })))
      ],
    );
  }
}
