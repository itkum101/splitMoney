import 'package:flutter/material.dart';
// ignore: must_be_immutable
class MiniContainer extends StatelessWidget {
  Widget? child;
 MiniContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: child
                );
  }
}