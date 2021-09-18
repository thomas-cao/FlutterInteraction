
import 'package:flutter/material.dart';

class HorizontalRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 70,
       decoration: const BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(6))
       ),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
               _buildItem("item1"),
               _buildItem("item2"),
               _buildItem("item3"),
               _buildItem("item4"),
           ],
         ),
       ),
    );
  }

  Widget _buildItem(String text) {
    final url = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F16%2F07%2F04%2F17577a32ae4b66a.jpg%21r650&refer=http%3A%2F%2Fbpic.588ku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634463535&t=5252d12c5a8c898a058005097ce51901";
    return GestureDetector(
       child: Column(
         children: [
           Image.network(url, width: 35, height: 35,),
           Text(text, style: TextStyle(fontSize: 13, color: Colors.green),)
         ],
       ),
    );
  }
}