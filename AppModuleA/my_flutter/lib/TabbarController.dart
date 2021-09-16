
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/loadingView.dart';

class TabbarController extends StatefulWidget {
   @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<TabbarController> {
   int _selectIndex = 0;
   final pages = [TodayPage(), PersionalPage()];
   final PageController _controller = PageController(initialPage: 0);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: "Today"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hdr_auto),
            label: "个人"
          ),
        ],
        currentIndex: _selectIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}
/**
 *   关于使用 IndexedStack 设计tabbarPage的问题
 *  1， IndexedStack 里面的页面不会懒加载 ，初始化时就会调用所有children的build
 *  并且每次切换的时候都会重新调用children 重新加载 造成不必要的重复创建销毁
 * 
 *  方案二 
 *  body: pages[_selectIndex],   
 *  这样可以做到懒加载 但是并没有解决 页面切换时的重复创建销毁
 * 
 *   方案三 
 *  PageView 搭配 AutomaticKeepAliveClientMixin 
 *   使用 AutomaticKeepAliveClientMixin 保持widget 不需要重新构建
 */



class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> with AutomaticKeepAliveClientMixin {
   
   @override
  bool get wantKeepAlive => true;
 
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("加载today页面");
    return Scaffold(
      backgroundColor: Colors.blue,
      body: LoadingView(
        isLoading: false,
        child: Stack(
          children: [
            RefreshIndicator(
              child: ListView(children: [
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 450,
                ),
                 Container(
                   // 设置渐变
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                  ),
                  width: 100,
                  height: 450,
                ),
                 Container(
                  color: Colors.yellow,
                  width: 100,
                  height: 450,
                ),
                 Container(
                  color: Colors.orange,
                  width: 100,
                  height: 450,
                )
              ],),
              onRefresh: _onRefresh,
            ),
          ],
        ),
        ),
    );
  }

  Future<void> _onRefresh() async {
      print("触发了下拉刷新");
  }
   
   int get milkshake => 10;
   // 导航栏设置
   Widget get customAppBar {
     return Column(
       children: [

       ],
     );
   }
}

class MyWidget extends StatelessWidget {
  final personNextToMe = 'That reminds me about the time when I was ten and our neighbor, her name was Mrs. Mable, and she said...';

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Chip(label: Text('I')),
      Chip(label: Text('really')),
      Chip(label: Text('really')),
      Chip(label: Text('really')),
      Chip(label: Text('really')),
      Chip(label: Text('really')),
      Chip(label: Text('really')),
      Chip(label: Text('need')),
      Chip(label: Text('a')),
      Chip(label: Text('job')),
    ]);
  }
}



class PersionalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("加载个人页面");
    return Center(
      child: MyWidget(),
    );
  }
}