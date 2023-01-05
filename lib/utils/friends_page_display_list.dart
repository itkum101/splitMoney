import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/utils/data.dart';

import '../Widgets/friend_tile.dart';

class FriendsPageDisplayList extends StatelessWidget {
  final myfriendList;
  const FriendsPageDisplayList({super.key, required this.myfriendList});

  @override
  Widget build(BuildContext context) {
    var myActivityList = context.watch<ActivityListProvider>().activities;
    var amounts = context.read<ActivityListProvider>().returnTotalAmount();
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
        Expanded(
          child: ListView.builder(
              itemCount: myfriendList.length,
              itemBuilder: ((context, index) {
                return FriendTile(
                  friendName: myfriendList[index].friendName,
                  friendEmail: myfriendList[index].friendEmail,
                  netAmount: amounts / (myfriendList.length),
                  onTap: () {},
                );
              })),
        )
      ],
    );
  }
}
