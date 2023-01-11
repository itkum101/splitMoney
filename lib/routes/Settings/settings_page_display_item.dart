import 'package:flutter/material.dart';
//Import Widgets
import 'package:splitmoney/widgets/settings_tile.dart';
import 'package:splitmoney/data/setting_data.dart';

//Import data

//Import Routes
import 'package:splitmoney/routes/Settings/settings_page_profile_display.dart';

class SettingsPageDisplayItem extends StatelessWidget {
  const SettingsPageDisplayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey[400],
        ),
        const SizedBox(
          height: 10,
        ),
        const SettingsPageProfileDisplay(),
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
    );
  }
}
