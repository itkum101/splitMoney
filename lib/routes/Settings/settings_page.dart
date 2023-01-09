import 'package:flutter/material.dart';
//Import Routes
import 'package:splitmoney/routes/Settings/settings_page_display_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Account",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: const SettingsPageDisplayItem()),
    );
  }
}
