import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_menu/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'entity/http_url.dart';

class DrawerWiget extends StatefulWidget {
  const DrawerWiget({Key? key}) : super(key: key);

  @override
  State<DrawerWiget> createState() => _DrawerWigetState();
}

class _DrawerWigetState extends State<DrawerWiget> {
  Future<bool> _loginOut() async {
    final sp = await SharedPreferences.getInstance();
    return await sp.setString(HttpUtil.tokenKey, "");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "https://img2.woyaogexing.com/2023/03/23/f96e0a5ed918ace0d9f949933a13dffe.jpeg",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            child: Container(
              width: 130,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.teal),
              child: const Center(
                child: Text(
                  "注销登录",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("确定注销登录？"),
                      actions: [
                        CupertinoButton(
                            child: const Text("取消"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        CupertinoButton(
                            child: const Text("确定"),
                            onPressed: () {
                              _loginOut().then((value) => {
                                    if (value)
                                      {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginPage()),
                                                (route) => route == null)
                                      }
                                  });
                            })
                      ],
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
