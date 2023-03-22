import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// @author huangxuan
/// @since 2023/3/21 10:01
/// QQ: 1360643904
/// 首页
class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: DefaultTabController(
              length: 2,
              child: TabBar(tabs: [
                Tab(
                  child: tabText(name: '美食'),
                ),
                Tab(
                  child: tabText(name: '推荐'),
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 13,
            child: RefreshIndicator(
              color: Colors.teal,
              onRefresh: () async {},
              child: MasonryGridView.count(padding: const EdgeInsets.all(8.0),itemCount: 300,crossAxisCount: 2, itemBuilder: (context,index) {
                return Container(
                  height: (index+1)*20,
                  child: Text(index.toString()),
                );
              })
            ),
          )
        ],
      ),
    );
  }

  Text tabText({required String name}) => Text(
        name,
        style: const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w200),
      );
}
