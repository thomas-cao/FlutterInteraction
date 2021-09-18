import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _getOnceRowitem(true),
          _getOnceRowitem(true),
          _getOnceRowitem(true),
        ],
      )
      );
  }
//  Expanded 将三个字widget 等分
  Widget _getOnceRowitem(bool first) {
    return Container(
         height: 50,
         margin: first ? const EdgeInsets.only(top: 2) : null,
         // 设置整个模块背景颜色渐变
         decoration: BoxDecoration(
             gradient: LinearGradient(colors: [Colors.red, Colors.yellow])
         ),
         child: Row(
           children: [
             Expanded(
               child: _getMianItem(),
               flex: 1,
             ),
             Expanded(
               child: _getupDownItem(),
               flex: 1,
             ),
             Expanded(
               child: _getupDownItem(),
               flex: 1,
             ),
           ],
         ),
    );
  }

  Widget _getMianItem() {
    final url = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic16.nipic.com%2F20111008%2F5203963_093910733000_2.jpg&refer=http%3A%2F%2Fpic16.nipic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634536840&t=a0c2924baa5a6ac2e1f7495e7a5e41eb";
      return Stack(
        alignment: AlignmentDirectional.topCenter,
       children: [
         Image.network(url,height: 50, width: double.infinity, fit: BoxFit.cover, alignment: AlignmentDirectional.center,),
         Container(
           margin: const EdgeInsets.only(top: 6),
           child: Text("title", style: TextStyle(fontSize: 14, color: Colors.red),)
           )
       ],
      );
  }
 
  Widget _getupDownItem() {
    return Column(
      children: [
       Expanded(child: _item(true)),
       Expanded(child: _item(false)),
      ],
    );
  }

  Widget _item(bool top) {
    BorderSide size = const BorderSide(color: Colors.white, width: 0.8);

     return FractionallySizedBox(
         widthFactor: 1,
         child: Container(
           // 设置边框线
           decoration: BoxDecoration(
             border: Border(
                left: size,
                bottom: top ? size : BorderSide.none
             )
           ),
           child: Center(
             child: Text("标题", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14),),
           ),
         ),
     );
  }

}