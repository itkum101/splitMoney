import 'package:flutter/material.dart';

import 'package:splitmoney/data/friend_data.dart';

import 'package:splitmoney/utils/icon_button_sample.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';
import 'package:splitmoney/widgets/mini_container.dart';
import 'package:splitmoney/widgets/text_box.dart';

class BalanceSettle extends StatefulWidget {
  final double netAmount;
  final String friendName;
  BalanceSettle({
    super.key,
    required this.friendName,
    required this.netAmount,
  });

  @override
  State<BalanceSettle> createState() => _BalanceSettleState();
}

class _BalanceSettleState extends State<BalanceSettle> {
  final _amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarSample(
            title: "Settle Up",
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
            Container(
              height: 1,
              color: Colors.grey[400],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You paid ${widget.friendName}",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacer(),
                    MiniContainer(
                      child: Icon(Icons.currency_rupee_rounded),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: TextBox(
                      isautoFocus: false,
                      isFilled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: "",
                      cursorColor: Colors.grey[400],
                      cursorHeight: 20,
                      controller: _amount
                        ..text = (widget.netAmount * -1).toString(),
                    )),
                    const Spacer(),
                    // Expanded(
                    //   child: TextBox(

                    //       isautoFocus: true),
                    // ),
                  ],
                )
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
