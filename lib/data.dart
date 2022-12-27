class GroupList {
  final String imgPath;
  final String groupName;
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
