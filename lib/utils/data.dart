import 'package:flutter/material.dart';

class GroupList {
  String imgPath;
  String groupName;
  GroupList({
    required this.imgPath,
    required this.groupName,
  });
}

List<GroupList> groups = [
  GroupList(groupName: "000", imgPath: "lib/assets/tea.png"),
  GroupList(groupName: "111", imgPath: "lib/assets/tea.png"),
  GroupList(groupName: "222", imgPath: "lib/assets/tea.png")
];

class GroupNameProvider with ChangeNotifier {
  final List<GroupList> _groupList = groups;
  List<GroupList> get groupList => _groupList;

  void addToGroupList(GroupList group) {
    _groupList.add(group);
    notifyListeners();
  }

  void removeFromList(GroupList group) {
    _groupList.remove(group);
    notifyListeners();
  }
}

class GroupTypes {
  final icon;
  final String type;

  GroupTypes({
    required this.icon,
    required this.type,
  });
}

List<GroupTypes> grouptype = [
  GroupTypes(icon: const Icon(Icons.airplanemode_on_outlined), type: "Trip"),
  GroupTypes(icon: const Icon(Icons.home_outlined), type: "Home"),
  GroupTypes(icon: const Icon(Icons.favorite_outline_rounded), type: "Couple"),
  GroupTypes(icon: const Icon(Icons.list_alt_outlined), type: "Others"),
];

class FriendList {
  final String friendName;
  final String friendEmail;
  FriendList({
    required this.friendName,
    required this.friendEmail,
  });
}

List<FriendList> friends = [
  FriendList(friendName: "Mukti Subedi", friendEmail: "muktisubedi@gmail.com"),
  FriendList(
      friendName: "Balkrishna Poudel",
      friendEmail: "balkrishnapoudel@gmail.com"),
  FriendList(
      friendName: "Aavash Chhetri", friendEmail: "aavashchhetri@gmail.com"),
  FriendList(
      friendName: "Ashim Sapkota", friendEmail: "ashimsapkota@gmail.com"),
];

class SettingsList {
  final icon;
  final Text settings;
  SettingsList({
    required this.icon,
    required this.settings,
  });
}

List<SettingsList> settingslist = [
  SettingsList(
    icon: const Icon(
      Icons.qr_code_2_rounded,
      size: 30,
    ),
    settings: Text(
      "Scan Code",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w500),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.email_rounded,
      size: 30,
    ),
    settings: Text(
      "Email settings",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.notifications,
      size: 30,
    ),
    settings: Text(
      "Notification settings",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.password_rounded,
      size: 30,
    ),
    settings: Text(
      "Password",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.rate_review_rounded,
    ),
    settings: Text(
      "Rate Us",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.contact_support_rounded,
    ),
    settings: Text(
      "Contact Us",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.logout_outlined,
      color: Colors.green,
    ),
    settings: const Text(
      "Log Out",
      style: TextStyle(
          fontSize: 16, color: Colors.green, fontWeight: FontWeight.w500),
    ),
  )
];

class Model extends ChangeNotifier {}
