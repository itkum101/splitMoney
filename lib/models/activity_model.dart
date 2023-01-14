import 'package:splitmoney/models/friend_model.dart';
import 'package:splitmoney/models/group_model.dart';

class Activity {
  final String description;
  final int netAmount;
  final String? date;
  final Friend paidBy;
  final List<Friend> involvedFriend;
  final String id;
  final Group involvedGroup;
  // We will use involvedFriend for friend.
  final Map<Friend, double> amountEachFriendSpent;
  // final DateTime? date;

  Activity(
      {required this.id,
      this.description = "",
      required this.netAmount,
      this.date,
      required this.paidBy,
      required this.amountEachFriendSpent,
      required this.involvedGroup,
      required this.involvedFriend});
  static Map<Friend, double> findMeMap(List<Friend> x, List<double> f) {
    Map<Friend, double> tempStructure = Map.fromIterables(x, f);
    return tempStructure;
  }
}
