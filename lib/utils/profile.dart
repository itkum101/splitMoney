import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 150,
              color: Colors.blueAccent,
            ),
            Positioned(
              left: 10,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              )),
              height: 100,
              width: 100,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
          ),
          child: Text(
            "GOOGLE FRIENDS",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 1.0,
                wordSpacing: 2.0,
                fontFamily: 'Roboto'),
          ),
        ),
      ],
    );
  }
}
