import 'package:flutter/material.dart';


class NewPage extends StatelessWidget {
  final String? pageName;
  /// 参数定义说明  required 代表这个参数必须传 但是如果pageName 如果是？的是可以传null的
  const NewPage({Key? key, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context, 
        child:  ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index){
          return NewsItem();
        },
      )),
      onRefresh: _onRefresh);
  }

    Future<void> _onRefresh() async {
      print("触发了下拉刷新");
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
      onTap: () {
        print("点击了订单");
      },
      child: Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      color: Color(0xfff1f1f1),
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            _orderTop(),
            _orderInfo(),
            _orderPrice()
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
      ),
    ), 
    );  
  }


/**
 *  row 两边对齐的方式
 *  1: 设置row 的mainAxisAlignment = MainAxisAlignment.spaceBetween
 *  2: 使用 Expanded 在中间填充 Expanded(child: SizedBox()),
 *  3: 使用Spacer 填充
 *  4: 使用Flexible Flexible(fit: FlexFit.tight, child: SizedBox()),
 * 
 */

  /// 商家信息
  _orderTop() {
    return Container(
      height: 40,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
         children: [
           Icon(Icons.wallet_travel, size: 18, color: Colors.black,),
           SizedBox(width: 6,),
           Text("造物自营店", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),),
           Spacer(),
           Text("待付款", style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),)
         ],
      ),
      );
  }
   
   /// 订单内容
   _orderInfo() {
      final url = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F16%2F07%2F04%2F17577a32ae4b66a.jpg%21r650&refer=http%3A%2F%2Fbpic.588ku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634463535&t=5252d12c5a8c898a058005097ce51901";
      final text = "万代模型JJJKjndnjl济南市的那是时间戳你说的是都能查到结束的你测试技能大赛从机动车你山地车将你山地车将你山地车将你电采暖测试机";
     return Container(
       padding: EdgeInsets.all(10),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Image.network(url, width: 72, height: 72, fit: BoxFit.cover,),
           SizedBox(width: 12,),
           Expanded(
             child: Text(text, style: TextStyle(color: Colors.grey, fontSize: 14),maxLines: 2, softWrap: true, overflow: TextOverflow.ellipsis,),
             ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Text("￥198",style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),),
               Text("x1", style: TextStyle(color: Colors.grey, fontSize: 12),)
             ],
           )
         ],
       ),
     );
   }

   /// 订单价格处理
   _orderPrice(){
     return Container(
        padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
        child: Column(
          children: [
            Divider(height: 1.0, color: Color(0xffF5F5F5),),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("共1件", style: TextStyle(fontSize: 13, color: Colors.grey),),
                Expanded(child: SizedBox()),
                Text("总价￥198", style: TextStyle(fontSize: 15, color: Colors.grey),),
                SizedBox(width: 4,),
                Text("实付￥100", style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700),)
              ],
            )
          ],
        ),
     );
   }

}