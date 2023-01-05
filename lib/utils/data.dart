import 'package:contacts_service/contacts_service.dart';
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
  final int netAmount;
  final String? phoneNumber;

  FriendList({
    required this.friendName,
    required this.friendEmail,
    this.netAmount = 0,
    this.phoneNumber,
  });
}

class ActivityList {
  final String description;
  final int netAmount;

  ActivityList({this.description = "", required this.netAmount});
}

List<ActivityList> activitiesDone = [
  ActivityList(
    description: "description[0]",
    netAmount: 10,
  ),
  ActivityList(
    netAmount: 30,
    description: "description[1]",
  ),
];

class ActivityListProvider with ChangeNotifier {
  List<ActivityList> _activities = activitiesDone;

  List<ActivityList> get activities => _activities;

  void addToActiviityList(ActivityList activity) {
    activities.add(activity);
    notifyListeners();
  }

  void removeToActivityList(ActivityList activity) {
    activities.remove(activity);
    notifyListeners();
  }

  int returnTotalAmount() {
    int finalTotalAmount = 0;
    for (int i = 0; i < activities.length; i++) {
      finalTotalAmount += activities[i].netAmount;
    }
    notifyListeners();
    return finalTotalAmount;
  }
}

List<FriendList> friends = [
  FriendList(
    friendName: "Mukti Subedi",
    friendEmail: "muktisubedi@gmail.com",
    netAmount: 0,
  ),
  FriendList(
    friendName: "Balkrishna Poudel",
    friendEmail: "balkrishnapoudel@gmail.com",
    netAmount: 0,
  ),
  FriendList(
    friendName: "Aavash Chhetri",
    friendEmail: "aavashchhetri@gmail.com",
    netAmount: 0,
  ),
  FriendList(
    friendName: "Ashim Sapkota",
    friendEmail: "ashimsapkota@gmail.com",
    netAmount: 0,
  ),
];

class FriendNameProvider with ChangeNotifier {
  final List<FriendList> _friendList = friends;
  List<FriendList> get friendList => _friendList;

  void addToGroupList(FriendList friend) {
    friendList.add(friend);
    notifyListeners();
  }

  void removeFromList(GroupList group) {
    friendList.remove(group);
    notifyListeners();
  }
}

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

List<Contact> contactLists = [];
