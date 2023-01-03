import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:splitmoney/routes/Main_Screen.dart';
import 'package:splitmoney/routes/add_a_friend.dart';
import 'package:splitmoney/routes/settings_page.dart';
import 'package:splitmoney/utils/data.dart';

void main() {
  runApp(ChangeNotifierProvider<GroupNameProvider>(
    create: (_) => GroupNameProvider(),
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => const MyApp(),
      },
      debugShowCheckedModeBanner: false,
      title: 'SplitMoney',
    ),
  ));
}
