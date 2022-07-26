import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
       },
       child: Container(
        color: Colors.blueGrey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        // 制作圆角
        child: Container(
           padding: EdgeInsets.only(bottom: 10),
           decoration: const BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(15))),
           child: Column(
            children: [
              _nftImage(),
              Text("data"),
              Text("data")
            ],
           ),
        ),
       ),
    );
  }
 
 // nft 图片信息
 final String imageUrl = "https://www.laihuastory.com/dist/img/make2.6c61dad.png";
 _nftImage() {
  return Stack(
 children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(width: double.infinity, height: 360),
          child: Image.network(imageUrl, fit: BoxFit.cover,),
          ),
       Image.network(imageUrl, height: 100,), 
    ],
  );
 }
   

}