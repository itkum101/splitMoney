import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final icon;
  final Text settings;
  void Function()? onSettingsTap;
  SettingsTile(
      {super.key,
      required this.icon,
      required this.settings,
      required this.onSettingsTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: ListTile(
        onTap: onSettingsTap,
        leading: icon,
        iconColor: Colors.grey[800],
        // title: Text(
        //   settings,
         
        title: settings,
      ),
    );
  }
}
