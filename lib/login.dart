import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 登录页面
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginBody(),resizeToAvoidBottomInset: false,);
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
                    width: 20,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        icon: Icon(
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
                      labelText: "用户名",
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
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
