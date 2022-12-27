import 'package:flutter/material.dart';
import 'package:splitmoney/Widgets/GroupTile.dart';
import 'package:splitmoney/routes/activitypage.dart';
import 'package:splitmoney/routes/friendspage.dart';
import 'package:splitmoney/routes/groupspage.dart';
import 'package:splitmoney/routes/settings.dart';

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
    const FriendsList(),
    const ActivityPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: page[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onPageChanged,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
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
