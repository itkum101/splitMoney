import 'package:flutter/material.dart';
import 'package:splitmoney/data/friend_data.dart';
import 'package:splitmoney/models/friend_model.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';
import 'package:splitmoney/widgets/friend_tile.dart';

class SettleUpPage extends StatefulWidget {

  const SettleUpPage({super.key});

  @override
  State<SettleUpPage> createState() => _SettleUpPageState();
}

class _SettleUpPageState extends State<SettleUpPage> {
  List<Friend> dummyList =
      friends.where((element) => element.netAmount < 0).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarSample(
          title: "Your balances to settle",
          leading: IconButtonSample(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icons.arrow_back),
          actions: [
            IconButtonSample(onPressed: () {}, icon: Icons.check),
            const SizedBox(width: 7)
          ],
        ),
      ),
      body: Column(
        children: [
          Container(height: 1, color: Colors.grey[400]),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: dummyList.length,
                  itemBuilder: ((context, index) {
                    return FriendTile(
                      friend: dummyList[index],
                      onTap: () {},
                    );
                  })))
        ],
      ),
    );
  }
}
