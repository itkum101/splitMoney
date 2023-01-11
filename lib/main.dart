import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Import Provider
import 'package:splitmoney/provider/activity_list_provider.dart';
import 'package:splitmoney/provider/friend_name_provider.dart';
import 'package:splitmoney/provider/group_name_provider.dart';
import 'package:splitmoney/routes/Groups/group_detail.dart';

//Import Routes
import 'package:splitmoney/routes/main_sreen.dart';
import 'package:splitmoney/routes/add_expense.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GroupNameProvider>(
        create: (_) => GroupNameProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => FriendNameProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ActivityListProvider(),
      )
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => const MyApp(),
        AddExpense.routeName: (ctx) => const AddExpense(),
        GroupDetail.routeName: (ctx) => const GroupDetail(),
        // EXAMPLE
        // CartScreen.routeName: (ctx) => CartScreen(),
        // In cartscreen simply do static const routeName= '/product-detail';

        // Navigator.pushNamed(context, CartScreen.routeName, arguments: product.id)
        //ACCESSING final prodcutId = ModalRoute.of(context)!.settings.arguments as String;
      },
      debugShowCheckedModeBanner: false,
      title: 'SplitMoney',
    ),
  ));
}
