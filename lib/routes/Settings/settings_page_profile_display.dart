import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';

class SettingsPageProfileDisplay extends StatefulWidget {
  const SettingsPageProfileDisplay({super.key});

  @override
  State<SettingsPageProfileDisplay> createState() =>
      _SettingsPageProfileDisplayState();
}

class _SettingsPageProfileDisplayState
    extends State<SettingsPageProfileDisplay> {
  final user = FirebaseAuth.instance.currentUser!;
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
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    // child: Image.asset("lib/assets/add_image.png"),
                  ),
                ),
                Positioned(
                    bottom: -7,
                    right: -7,
                    child: IconButtonSample(
                        onPressed: () {}, icon: Icons.add_a_photo_rounded))
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 user.displayName.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.grey[800]),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                 user.email.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey[500]),
                )
              ],
            ),
          ],
        ),
        IconButtonSample(onPressed: () {}, icon: Icons.edit_outlined)
      ]),
    );
  }
}
