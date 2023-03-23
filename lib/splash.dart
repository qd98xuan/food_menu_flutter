import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_menu/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'login.dart';

// 启动页面
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double firstTextPaddingTop = 200.0;
  double secondTextPaddingTop = 200.0;
  double thirdTextPaddingTop = 200.0;
  double fourthTextPaddingTop = 200.0;
  static const double logoFontSize = 30.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        firstTextPaddingTop = 0;
        secondTextPaddingTop = 0;
        thirdTextPaddingTop = 0;
        fourthTextPaddingTop = 0;
      });
    });
  }

  // 获取登录的token
  Future<String> _getToken() async {
    final sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    if (token != null) {
      return token;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.fromLTRB(120, 0, 120, 0),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                    child: AnimatedPadding(
                      padding:
                          EdgeInsets.fromLTRB(0, 0, 0, firstTextPaddingTop),
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 200),
                      child: const Text(
                        "我",
                        style: TextStyle(
                            color: Colors.teal, fontSize: logoFontSize),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: AnimatedPadding(
                      padding:
                          EdgeInsets.fromLTRB(0, 0, 0, secondTextPaddingTop),
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 300),
                      child: const Text(
                        "的",
                        style: TextStyle(
                            color: Colors.amberAccent, fontSize: logoFontSize),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: AnimatedPadding(
                      padding:
                          EdgeInsets.fromLTRB(0, 0, 0, thirdTextPaddingTop),
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 400),
                      child: const Text(
                        "菜",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontSize: logoFontSize),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Center(
                    child: AnimatedPadding(
                      padding:
                          EdgeInsets.fromLTRB(0, 0, 0, fourthTextPaddingTop),
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        "谱",
                        style: TextStyle(
                            color: Colors.blue, fontSize: logoFontSize),
                      ),
                      onEnd: () {
                        // sleep(const Duration(milliseconds: 300));
                        _getToken().then((value) => {
                              if (value == "")
                                {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (c) => const LoginPage()),
                                      (route) => route == null)
                                }
                              else
                                {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (c) => const HomePage()),
                                      (route) => route == null)
                                }
                            });
                      },
                    ),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          )
        ],
      ),
    );
  }
}
