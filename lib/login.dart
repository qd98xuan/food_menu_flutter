import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginBody());
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  double logoPaddingTop = 300.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _setLogoPaddingTop(0.0);
    });
  }

  void _setLogoPaddingTop(value) {
    setState(() {
      logoPaddingTop = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.fromLTRB(0, logoPaddingTop, 0, 0),
              child: Center(
                child: Text(
                  "我的菜谱",
                  style: TextStyle(color: Colors.teal, fontSize: 50),
                ),
              ),
              curve: Curves.easeIn,
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              color: Colors.teal,
              child: TextButton(
                child: Text("data"),
                onPressed: () {},
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
        ],
      ),
      // child: Column(
      //   children: [
      //     AnimatedPadding(padding: EdgeInsets.fromLTRB(0, logoPaddingTop, 0, 0), duration: Duration(seconds: 1))
      //     Container(
      //       padding: const EdgeInsets.fromLTRB(0, , 0, 0),
      //       child: Text("我的菜谱",style: TextStyle(color: Colors.teal,fontSize: 30),),
      //     )
      //   ],
      // ),
    );
  }
}