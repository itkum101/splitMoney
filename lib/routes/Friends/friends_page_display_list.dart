import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Import Provider
import 'package:splitmoney/provider/activity_list_provider.dart';
import 'package:splitmoney/provider/friend_name_provider.dart';


//Import Widgets
import '../../widgets/friend_tile.dart';
import 'package:splitmoney/widgets/overall_expense_info_row.dart';

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
        //row showing overall expense information
        const OverallExpenseInfoRow(),
        const SizedBox(
          height: 10,
        ),

        //Listview of all added friends 
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
