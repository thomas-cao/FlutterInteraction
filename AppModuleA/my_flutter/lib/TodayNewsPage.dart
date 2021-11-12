import 'package:flutter/material.dart';
import 'package:my_flutter/NewPage.dart';
import 'dart:ui';

import 'package:my_flutter/screenInfo.dart';

// StatelessWidget 转为 StatefulWidget 的快捷键 将鼠标移到StatelessWidget上按（command + .）
//  StatelessWidget 快速生成快捷键 直接输入 stless 回车
// StatefulWidget 快速生成快捷键 输入 stful 回车

class TodayNewsPage extends StatefulWidget {
  @override
  _TodayNewsPageState createState() => _TodayNewsPageState();
}

class _TodayNewsPageState extends State<TodayNewsPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final List<Map<String, dynamic>> _tabIndexConfigs = [
    {
      "title": "推荐",
      "subUrl": "dynamic/headline-list",
      "types": {"from": "toutiao"}
    },
    {
      "title": "科技",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1348649580692"}
    },
    {
      "title": "历史",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1368497029546"}
    },
    {
      "title": "军事",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1348648141035"}
    },
    {
      "title": "手机",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1348649654285"}
    },
    {
      "title": "体育",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1348649079062"}
    },
    {
      "title": "财经",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1348648756099"}
    },
    {
      "title": "教育",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1348654225495"}
    },
    {
      "title": "娱乐",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1348648517839"}
    },
    {
      "title": "公开课",
      "subUrl": "dynamic/normal-list",
      "types": {"from": "T1524118019401"}
    },
  ];
  late TabController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabIndexConfigs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: ScreenInfo.statusBarHeight + 86,
            child: Column(
              children: [_customNavBar(), _pageIndexView()],
            ),
          ),
         Flexible(
           child: TabBarView(
             controller: _controller,
             children: _tabIndexConfigs.map((e) {
               return NewPage(pageName: e["titless"],);
             }).toList(),
           ),
         )
        ],
      ),
    );
  }

  /// pageIndex
  _pageIndexView() {
    return Container(
      height: 34.0,
      child: TabBar(
        controller: _controller,
        labelColor: Colors.black,
        indicatorColor: Colors.purple,
        indicatorPadding: EdgeInsets.fromLTRB(15, 0, 15, 4),
        isScrollable: true,
        labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontSize: 17),
        tabs: _tabIndexConfigs.map((e) {
          return Tab(
            text: e["title"].toString(),
          );
        }).toList(),
      ),
    );
  }

  /// 自定义导航栏
  _customNavBar() {
    return Container(
      height: ScreenInfo.statusBarHeight + 52,
      color: Colors.redAccent,
      child: Container(
        margin: EdgeInsets.only(top: ScreenInfo.statusBarHeight),
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Row(
          // 搜索框
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _searchBox(),
            SizedBox(
              width: 10,
            ),
            _postItem()
          ],
        ),
      ),
    );
  }

  /// 发布按钮
  _postItem() {
    return Container(
      width: 30,
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "发布",
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }

  /// 搜索框
  _searchBox() {
    return Expanded(
        child: Container(
      height: 36,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      padding: EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(Icons.search, size: 22, color: Color(0xfff1f1f1)),
          SizedBox(
            width: 1,
          ),
          Expanded(
              child: Text(
            "鄂尔多斯股票拉升 | 开设赌场是圣诞节承诺书的首都机场",
            style: TextStyle(color: Colors.lightGreen, fontSize: 15),
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    ));
  }
}
