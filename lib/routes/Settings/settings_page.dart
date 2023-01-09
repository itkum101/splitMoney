import 'package:flutter/material.dart';

//Import Routes
import 'package:splitmoney/routes/Settings/settings_page_display_item.dart';
//Import Widgets
import 'package:splitmoney/widgets/app_bar_sample.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBarSample(
              title: "Account",
            ),
          ),
          body: const SettingsPageDisplayItem()),
    );
  }
}
