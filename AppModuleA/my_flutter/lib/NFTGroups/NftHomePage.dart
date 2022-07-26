import 'package:flutter/material.dart';
import 'package:my_flutter/NFTGroups/NftGoodsCategory.dart';
import 'package:my_flutter/NewPage.dart';


class NftHomePage extends StatefulWidget {

  @override
  State<NftHomePage> createState() => _NftHomePageState();
}

class _NftHomePageState extends State<NftHomePage>  with TickerProviderStateMixin {

  late TabController _controller;

@override
  void initState() {
 super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: Text("NFT"),
            backgroundColor: Colors.blueGrey,
            leading: Icon(Icons.safety_check, size: 30,),
            actions: [
              IconButton(onPressed: () {
                  print("点击导航右侧按钮");
              }, icon: Icon(Icons.message_outlined))   
            ],
          ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              final url = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F16%2F07%2F04%2F17577a32ae4b66a.jpg%21r650&refer=http%3A%2F%2Fbpic.588ku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634463535&t=5252d12c5a8c898a058005097ce51901";
            return <Widget> [
                 SliverAppBar(
                  leading: Text(""),
                  backgroundColor: Colors.blueGrey,
                  expandedHeight: 210,
                  pinned: false,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10), 
                    child: PageView(
                     children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.network(url, fit: BoxFit.cover,),
                        ),
                        Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.network(url, fit: BoxFit.cover,),
                        ),
                        Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Image.network(url, fit: BoxFit.cover,),
                        )
                     ],
                    ),
                    ),
                 ),
                 SliverPersistentHeader(
                  pinned: true,
                  delegate: StickyTabBarDelegate(
                    child: TabBar(
                      tabs: [Tab(text: "数字藏品",), Tab(text: "发售日历",), Tab(text: "内容精选",)],
                      controller: _controller,
                      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:  Colors.white),
                      unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.lightGreen),
                      padding: EdgeInsets.only(right: 150),
                      indicator: const BoxDecoration(),
                      labelPadding: EdgeInsets.only(left: 10),
                      )
                    ),
                  )
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: [
               NftGoodsCategory(categoryCode: "数字藏品"),
               NewPage(pageName: "pageName"),
               NewPage(pageName: "pageName"),
            ]
            ),
        )
      );
  }
}


class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
final TabBar child;

StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
     return Container(
        color: Theme.of(context).backgroundColor,
        child: this.child,
     );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.child.preferredSize.height;
  @override
  // TODO: implement minExtent
  double get minExtent => this.child.preferredSize.height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

}