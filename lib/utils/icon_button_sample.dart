import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconButtonSample extends StatelessWidget {
  void Function()? onPressed;
  IconData? icon;
  IconButtonSample({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashRadius: 20,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 23,
          color: Colors.grey[800],
        ));
  }
}
