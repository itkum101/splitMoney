import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splitmoney/screen/MainScreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (ctx) => const MyApp()},
    debugShowCheckedModeBanner: false,
    title: 'SplitMoney',
  ));
}
