import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_menu/entity/http_url.dart';
import 'package:food_menu/entity/login_entity.dart';
import 'package:uuid/uuid.dart';

// 登录页面
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  double logoPaddingTop = 300.0;
  bool isObscureText = true;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController verificationCode = TextEditingController();
  final dio = Dio();
  final uuid = Uuid();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _setLogoPaddingTop(0.0);
    });
  }

  void _getVerificationCode() async {
    Response<VerificationCodeEntity> response = await dio.get(
        "${HttpUtil.baseUrl}${HttpUtil.sys}randomImage/${uuid.v1()}",
        options: Options(headers: {"X-Access-Token": "1"}));
    print("验证码:${response.data?.code.toString()}");
  }

  void _setLogoPaddingTop(value) {
    setState(() {
      logoPaddingTop = value;
    });
  }

  double leftPadding = 50.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: const Text(
              "登录",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(leftPadding, 150, 0, 0),
              child: const Text(
                "开始准备好好吃饭",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              )),
          Container(
            padding: EdgeInsets.fromLTRB(leftPadding, 50, leftPadding, 0),
            child: TextField(
              controller: userName,
              decoration: const InputDecoration(
                labelText: "用户名",
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(leftPadding, 10, leftPadding, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        2 * leftPadding -
                        20,
                    child: TextField(
                      controller: password,
                      obscureText: isObscureText,
                      decoration: const InputDecoration(
                          labelText: "密码",
                          labelStyle: TextStyle(color: Colors.blue)),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                            getLockWidget(isObscureText))), //Icons.lock_open
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.fromLTRB(leftPadding, 10, leftPadding, 0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 4 * leftPadding,
                  child: TextField(
                    controller: verificationCode,
                    decoration: const InputDecoration(
                      labelText: "验证码",
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  width: leftPadding * 2,
                  height: 30,
                  child: GestureDetector(
                    child: Image.memory(
                      base64Decode(
                          "data:image/jpg;base64,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"
                              .split(",")[1]),
                      width: 2 * leftPadding,
                      height: 40,
                    ),
                    onTap: () {
                      // 刷新验证码
                      print("dddddddd");
                      _getVerificationCode();
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(leftPadding, 10, leftPadding, 0),
            child: GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: MediaQuery.of(context).size.width - 4 * leftPadding,
                height: 40,
                child: const Text(
                  "登录",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData getLockWidget(isObscureText) {
    if (isObscureText) {
      return Icons.lock_outline_rounded;
    } else {
      return Icons.lock_open_rounded;
    }
  }
}
