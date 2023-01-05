import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:splitmoney/routes/Main_Screen.dart';
import 'package:splitmoney/routes/add_a_friend.dart';
import 'package:splitmoney/routes/add_expense.dart';
import 'package:splitmoney/routes/settings_page.dart';
import 'package:splitmoney/utils/data.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GroupNameProvider>(
        create: (_) => GroupNameProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => FriendNameProvider(),
      ),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => const MyApp(),
        AddExpense.routeName: (ctx) => const AddExpense(),

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
