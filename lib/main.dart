import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_menu/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的菜谱',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.green,
          accentColor: Colors.teal),
      home: const Splash(),
    );
  }
}
