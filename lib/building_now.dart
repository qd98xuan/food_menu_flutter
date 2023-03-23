import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildingNow extends StatelessWidget {
  BuildingNow({required bool this.isInnerPage, Key? key}) : super(key: key);

  // 是否是内部页面
  bool isInnerPage = false;

  @override
  Widget build(BuildContext context) {
    return isInnerPage
        ? const Scaffold(body: BuildingNowBody())
        : Scaffold(
            appBar: AppBar(
              title: const Text("敬请期待..."),
            ),
            body: const BuildingNowBody());
  }
}

class BuildingNowBody extends StatelessWidget {
  const BuildingNowBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("lib/src/敬请期待.png"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "页面建设中，敬请期待...",
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
