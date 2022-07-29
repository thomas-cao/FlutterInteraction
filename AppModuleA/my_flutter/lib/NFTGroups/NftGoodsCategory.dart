import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_flutter/NFTGroups/NftGoodsDetail.dart';

class NftGoodsCategory extends StatelessWidget {

 final String categoryCode;
  /// 参数定义说明  required 代表这个参数必须传 但是如果pageName 如果是？的是可以传null的
  const NftGoodsCategory({Key? key, required this.categoryCode}) : super(key: key);
    

 @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context, 
        child:  ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index){
          return NftGoodsItem();
        },
      )),
      onRefresh: _onRefresh);
  }

    Future<void> _onRefresh() async {
      print("触发了下拉刷新");
  }
}

class NftGoodsItem extends StatelessWidget {

    @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        print("点击查看NFT");
        Navigator.push(context, MaterialPageRoute(builder: (context) => NftGoodsDetail()));
       },
       child: Container(
        color: Colors.blueGrey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        // 制作圆角
        child: Container(
           padding: EdgeInsets.only(bottom: 10),
           decoration: const BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(21))),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nftImage(),
             _nftName(),
              _nftTagView(),
              _nftPrice()
            ],
           ),
        ),
       ),
    );
  }

// hftm名称信息
Widget _nftName() {
  return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        children: [
          Text("黄河·陕西·大河上下", style:  TextStyle(color: Colors.white, fontSize: 16),),
          Icon(Icons.access_time, color: Colors.white,)
        ],
      ),
  );
}

// nft标签
Widget _nftTagView() {
  return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 0), 
      child: Row(
        children: [
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
            child: Text("皇冠", style: TextStyle(color: Colors.grey, fontSize: 12),)
            ),
            SizedBox(width: 5,),
            Container(
            color: Colors.yellow,
            padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
            child: Text("限量", style: TextStyle(color: Colors.grey, fontSize: 12),)
            ),
            Container(
            color: Colors.black12,
            padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
            child: Text("1000份", style: TextStyle(color: Colors.yellowAccent, fontSize: 12),)
            ),
            SizedBox(width: 5,),
            Container(
            color: Colors.black12,
            padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
            child: Text("文件夹", style: TextStyle(color: Colors.yellowAccent, fontSize: 12),)
            ),
        ],
      ),
  );
}

// nft价格
Widget _nftPrice() {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.access_alarm),
        Text("中国黄河文化经济发展研究会"),
        Spacer(),
        Text("￥ 18.00", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
      ],
    ),
  );
}

 
 // nft 图片信息
 final String imageUrl = "https://www.laihuastory.com/dist/img/make2.6c61dad.png";
 _nftImage() {
  return Stack(
    alignment: Alignment.center,
 children: [
       Container(
         width: double.infinity,
         height: 310,
         child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          child: Image.network(imageUrl, fit: BoxFit.cover,),
          ),
       ),
       ClipRRect(
         borderRadius: BorderRadius.all(Radius.circular(21)),
         child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: double.infinity,
                height: 310,
                child: _imageTopCover(),
              ),
         ),
       ),
    ],
  );
 }
   
   _imageTopCover() {
    return Container(
       padding: EdgeInsets.all(20),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Row(
             children: [
               Icon(Icons.ac_unit, color: Colors.yellow,),
               Text("即将开售 18:24:56", style: TextStyle(color: Colors.yellow, fontSize: 14),),
             ],
           ),
           Center(
            child: Image.network(imageUrl, fit: BoxFit.fitWidth, width:  150, height:  150,),
           ),
           Text("包含多件藏品", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
        ]
       ),
    );
   }

}