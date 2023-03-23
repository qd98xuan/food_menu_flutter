import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWiget extends StatefulWidget {
  const DrawerWiget({Key? key}) : super(key: key);

  @override
  State<DrawerWiget> createState() => _DrawerWigetState();
}

class _DrawerWigetState extends State<DrawerWiget> {
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
              child: Image.network("https://img2.woyaogexing.com/2023/03/23/f96e0a5ed918ace0d9f949933a13dffe.jpeg",fit: BoxFit.fill,),
            ),
          ),
        ),
      ],
    );
  }
}
