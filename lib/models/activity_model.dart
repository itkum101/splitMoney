import 'package:splitmoney/models/friend_model.dart';

class Activity {
  final String description;
  final int netAmount;
  final String? date;
  final Friend paidBy;
  final List<Friend> involvedFriend;

  // final DateTime? date;

  Activity(
      {this.description = "",
      required this.netAmount,
      this.date,
      required this.paidBy,
      required this.involvedFriend});
}
