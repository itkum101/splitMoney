import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  void Function()? onPressed;

  Widget? boxImageChild;
  Profile({super.key, this.onPressed, this.boxImageChild});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.green[200],
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  splashRadius: 20,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
              IconButton(
                  splashRadius: 20,
                  color: Colors.white,
                  onPressed: onPressed,
                  icon: const Icon(Icons.settings_outlined))
            ],
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          height: 60,
          width: 60,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: boxImageChild,
          ),
        ),
      ],
    );
  }
}
