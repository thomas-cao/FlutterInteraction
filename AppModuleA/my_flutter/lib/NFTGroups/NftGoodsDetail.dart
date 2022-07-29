import 'package:flutter/material.dart';
import 'package:my_flutter/NFTGroups/Nft3DModelViewr.dart';
import 'package:my_flutter/NFTGroups/NftShow3DView.dart';
import 'package:my_flutter/screenInfo.dart';

class NftGoodsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottom(),
      body: Container(
        width: ScreenInfo.medaiQueryData.size.width,
        height: ScreenInfo.medaiQueryData.size.height,
        color: Colors.blueGrey,
        child: Stack(
          children: [
            MediaQuery.removePadding (
              context: context,
              removeTop: true,
              child: ListView(
                // padding: EdgeInsets.fromLTRB(10, 85, 10, 0),
                children: [
                  Container(height: 100, color: Colors.blueGrey,),
                  NftModelViewr(),
                  _build3dModelName(),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),
            ),
            buildNavigationBar(),
          ],
        ),
      ),
    );
  }




 // 展示3d模型相关
final String plateUrl = "https://cn.epal-pallets.org/fileadmin/user_upload/ntg_package/CP/CP8_Palette/Epal_23.10.1727764.jpg";
 // 模型说明相关
 Widget _build3dModelName() {
    return  Container(
        height: 150,
        child: Stack(
          children: [
              Center(
                child: Image.network(plateUrl, width:  ScreenInfo.medaiQueryData.size.width * 0.8, height: 120, fit: BoxFit.fitWidth,)
                ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("NFT名称"),
                    Text("限量1000份")
                  ],
                ),
              )
          ],
        ),
    );
 }



// 导航栏按钮
Widget buildNavigationBar() {
  return Container(
     alignment: Alignment.bottomCenter,
     height: ScreenInfo.statusBarHeight + 44,
     padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back, color: Colors.white,),
        Icon(Icons.accessibility_new, color: Colors.white,),
      ],
     ),
  );
}

Widget _buildBottom() {
  return Container(
     width: double.infinity,
     height: 83,
     color: Colors.black,
     padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("￥18.00", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
        Container(
          width: 90,
          height: 38,
          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(19))),
          child: Center(child: Text("立即够买", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),
        )
      ],
     ),
  );
}

}
