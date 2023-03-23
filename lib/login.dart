import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_menu/entity/http_url.dart';
import 'package:food_menu/entity/login_entity.dart';
import 'package:food_menu/home_page.dart';
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
  String verificationCodeStr = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _setLogoPaddingTop(0.0);
      _getVerificationCode();
    });
  }

  // 获取验证码
  String verificationCodeKey = '';

  void _getVerificationCode() async {
    verificationCodeKey = uuid.v1();
    Response response = await dio.get(
        "${HttpUtil.baseUrl}${HttpUtil.sys}randomImage/$verificationCodeKey",
        options: Options(headers: {"X-Access-Token": "1"}));
    if (response.data['code'] == 0) {
      setState(() {
        verificationCodeStr = response.data['result'];
      });
    } else {
      print("错误码：${response.data['code']}");
      setState(() {
        verificationCodeStr = '';
      });
    }
  }

  // 登录
  bool loginLoading = false;
  String loginMsg = "";
  int loginCode = 200;

  void _login() async {
    setState(() {
      loginLoading = true;
    });
    Response response =
        await dio.post("${HttpUtil.baseUrl}${HttpUtil.sys}login", data: {
      "captcha": verificationCode.text.toString(),
      "checkKey": verificationCodeKey,
      "password": password.text.toString(),
      "username": userName.text.toString()
    });
    setState(() {
      loginCode = response.data['code'];
      loginMsg = response.data['message'];
    });
    if (response.data['code'] == 200) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => route == null);
      print("登录成功");
      print(response.data['result']);
    } else {
      print(response.data['message']);
    }
    _getVerificationCode();
    setState(() {
      loginLoading = false;
    });
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
          Expanded(
            flex: 1,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(leftPadding, 150, 0, 0),
                child: const Text(
                  "开始准备好好吃饭",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                )),
          ),
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
                    child: verificationCodeStr == ''
                        ? SizedBox(
                            width: 2 * leftPadding,
                            height: 40,
                            child: const Text("加载失败"),
                          )
                        : Image.memory(
                            base64Decode(verificationCodeStr.split(",")[1]),
                            width: 2 * leftPadding,
                            height: 40,
                          ),
                    onTap: () {
                      // 刷新验证码
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
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: loginLoading ? Colors.black12 : Colors.blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    width: MediaQuery.of(context).size.width - 4 * leftPadding,
                    height: 40,
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Center(
                      child: Text(
                        loginLoading ? "正在登录..." : "登录",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  loginCode == 200
                      ? Container()
                      : Center(
                          child: Text(
                            loginMsg,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 15),
                          ),
                        )
                ],
              ),
              onTap: () {
                if (!loginLoading) {
                  _login();
                }
              },
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
