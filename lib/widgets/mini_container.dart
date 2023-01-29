import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MiniContainer extends StatelessWidget {
  Widget? child;
  MiniContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.grey[700]!, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }
}
