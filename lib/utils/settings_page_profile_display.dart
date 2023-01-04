import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsPageProfileDisplay extends StatelessWidget {
  const SettingsPageProfileDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 30,
                  ),
                ),
                Positioned(
                  bottom: -7,
                  right: -7,
                  child: IconButton(
                      focusColor: Colors.white24,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo_rounded)),
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amrit Sharma",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.grey[800]),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  "amritsharma@gmail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey[500]),
                )
              ],
            ),
          ],
        ),
        IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.grey[800],
            ))
      ]),
    );
  }
}
