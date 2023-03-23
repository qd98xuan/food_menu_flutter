import 'package:flutter/material.dart';
import 'package:food_menu/front_page.dart';
import 'package:food_menu/me.dart';

/// @author huangxuan
/// @since 2023/3/21 09:58
/// QQ: 1360643904
/// 首页
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Drawer(),
      body: HomePageBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

// 主页面
class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * (1 / 10),
          child: SearchBar(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * (8 / 10),
          child: viewPage,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * (1 / 10),
          child: NavigationBar(onTap: (selectItem) {
            _changeHomePage(selectItem);
          }),
        ),
      ],
    );
  }

  // viewPager的页面
  Widget viewPage = const FrontPage();

  void _changeHomePage(type) {
    switch (type) {
      case 0:
        setState(() {
          viewPage = const FrontPage();
        });
        break;
      case 3:
        setState(() {
          viewPage = const Me();
        });
        break;
    }
  }
}

// 导航栏
class NavigationBar extends StatefulWidget {
  NavigationBar({required this.onTap, Key? key}) : super(key: key);
  Function(int selectItem) onTap;

  @override
  State<NavigationBar> createState() => _NavigationBarState(onTap: onTap);
}

class _NavigationBarState extends State<NavigationBar> {
  _NavigationBarState({required  this.onTap});

  // 选中的tab
  // 0 首页
  // 1 视频
  // 2 收藏
  // 3 我的
  int selectedTab = 0;
  Function(int selectItem) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: itemView(
                  selectIcon: Icons.home,
                  normalIcon: Icons.home_outlined,
                  name: "首页",
                  isSelect: selectedTab == 0),
              onTap: () {
                setState(() {
                  selectedTab = 0;
                  onTap(selectedTab);
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: itemView(
                  selectIcon: Icons.video_collection,
                  normalIcon: Icons.video_collection_outlined,
                  name: "视频",
                  isSelect: selectedTab == 1),
              onTap: () {
                setState(() {
                  selectedTab = 1;
                  onTap(selectedTab);
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: const Icon(
                Icons.add_box,
                color: Colors.teal,
                size: 50,
              ),
              onTap: () {},
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: itemView(
                  selectIcon: Icons.star,
                  normalIcon: Icons.star_border_outlined,
                  name: "收藏",
                  isSelect: selectedTab == 2),
              onTap: () {
                setState(() {
                  selectedTab = 2;
                  onTap(selectedTab);
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              child: itemView(
                  selectIcon: Icons.people,
                  normalIcon: Icons.people_alt_outlined,
                  name: "我的",
                  isSelect: selectedTab == 3),
              onTap: () {
                setState(() {
                  selectedTab = 3;
                  onTap(selectedTab);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // 导航栏按钮
  Widget itemView(
      {required IconData selectIcon,
      required IconData normalIcon,
      required String name,
      required bool isSelect}) {
    return Column(
      children: [
        Icon(
          isSelect ? selectIcon : normalIcon,
          color: isSelect ? Colors.black : Colors.black54,
          size: 35,
        ),
        Text(
          name,
          style: TextStyle(
              color: isSelect ? Colors.black : Colors.black54, fontSize: 14),
        )
      ],
    );
  }
}

// 搜索栏
class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 30, 0, 0),
      child: Row(
        children: [
          GestureDetector(
            child: const Icon(
              Icons.format_list_bulleted,
              size: 30,
              color: Colors.black45,
            ),
            onTap: () {
              if (Scaffold.of(context).isDrawerOpen) {
                Scaffold.of(context).closeDrawer();
              } else {
                Scaffold.of(context).openDrawer();
              }
            },
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
            width: MediaQuery.of(context).size.width * (3 / 4),
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.black12),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * (4 / 7),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(Icons.search),
                      onTap: () {},
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: GestureDetector(
              child: Icon(Icons.wifi_tethering),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
