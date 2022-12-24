import 'package:flutter/material.dart';
import 'package:splitmoney/Widgets/GroupList.dart';
import 'package:splitmoney/pages/activitypage.dart';
import 'package:splitmoney/pages/friendspage.dart';
import 'package:splitmoney/pages/groupspage.dart';
import 'package:splitmoney/pages/settings.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

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
        appBar: AppBar(
          
          backgroundColor: Colors.greenAccent,
          title: const Text("SplitMoney"),
        ),
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
