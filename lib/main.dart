import 'package:flutter/material.dart';

import 'package:splitmoney/routes/Main_Screen.dart';
import 'package:splitmoney/routes/add_a_friend.dart';
import 'package:splitmoney/routes/settings_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (ctx) => const MyApp(),
    },
    debugShowCheckedModeBanner: false,
    title: 'SplitMoney',
  ));
}
