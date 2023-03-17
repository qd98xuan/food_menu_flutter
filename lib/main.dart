import 'dart:ui';

import 'package:flutter/material.dart';

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
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody()
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  double logoPaddingTop = 0;

  @override
  Widget build(BuildContext context) {
    setState(() {

    });
    return Center(
      child: Column(
        children: [
          AnimatedPadding(padding: EdgeInsets.fromLTRB(0, logoPaddingTop, 0, 0), duration: Duration(seconds: 1))
          Container(
            padding: const EdgeInsets.fromLTRB(0, , 0, 0),
            child: Text("我的菜谱",style: TextStyle(color: Colors.teal,fontSize: 30),),
          )
        ],
      ),
    );
  }
}
