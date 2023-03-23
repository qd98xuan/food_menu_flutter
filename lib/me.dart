import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Me extends StatelessWidget {
  const Me({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MeHome(),
    );
  }
}

class MeHome extends StatefulWidget {
  const MeHome({Key? key}) : super(key: key);

  @override
  State<MeHome> createState() => _MeHomeState();
}

class _MeHomeState extends State<MeHome> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
