import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarSample extends StatelessWidget {
  List<Widget>? actions;
  Widget? leading;
  final String title;
  AppBarSample({super.key, this.actions, this.title = "", this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.grey[800], fontSize: 23, fontWeight: FontWeight.w500),
      ),
      leading: leading,
      actions: actions,
    );
  }
}
