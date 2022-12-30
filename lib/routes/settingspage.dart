import 'package:flutter/material.dart';
import 'package:splitmoney/Widgets/settings_tile.dart';
import 'package:splitmoney/data.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                                fontWeight: FontWeight.w600,
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
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: settingslist.length,
                itemBuilder: ((context, index) {
                  return SettingsTile(
                    icon: settingslist[index].icon,
                    settings: settingslist[index].settings,
                    onSettingsTap: () {},
                  );
                })),
          )
        ],
      )),
    );
  }
}
