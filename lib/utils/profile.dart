import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          color: Colors.blue[300],
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
                  onPressed: () {},
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
            color: Colors.amber[300],
            borderRadius: BorderRadius.circular(10),
          )),
        ),
      ],
    );
  }
}
