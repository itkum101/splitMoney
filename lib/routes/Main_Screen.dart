import 'package:flutter/material.dart';
import 'package:splitmoney/routes/activity_page.dart';
import 'package:splitmoney/routes/friends_page.dart';
import 'package:splitmoney/routes/groups_page.dart';
import 'package:splitmoney/routes/settings_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  void onPageChanged(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> page = [
    const GroupsPage(),
    const FriendsPage(),
    const ActivityPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[100],
        body: page[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onPageChanged,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ));
  }
}
