import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/auth/auth_page.dart';
import 'package:splitmoney/firebase_options.dart';

//Import Provider
import 'package:splitmoney/provider/activity_list_provider.dart';
import 'package:splitmoney/provider/friend_name_provider.dart';
import 'package:splitmoney/provider/group_name_provider.dart';
import 'package:splitmoney/routes/Groups/friend_list_group_selector.dart';


//Import Routes
import 'package:splitmoney/routes/main_screen.dart';
import 'package:splitmoney/routes/add_expense.dart';
import 'package:splitmoney/routes/friend_list_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/': (ctx) => const AuthPage(),
        AddExpense.routeName: (ctx) => const AddExpense(),

        FriendListSelector.routeName: (ctx) => const FriendListSelector(),
        FriendListGroupSelector.routeName: (ctx) => FriendListGroupSelector(),
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
