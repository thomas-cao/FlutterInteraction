import 'package:flutter/material.dart';

class THomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          createSection(),
          Expanded(
            child: createList()
            ),
        ],
      )
      ); 
  }


  Widget createSection() {
     return  Container(
       color: Colors.white,
       height: 50,
       padding: EdgeInsets.all(10),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
            Text(
         "Ta们在卖", 
         style: TextStyle(fontSize: 18, color: Colors.black),
         ),
         ],
       ),
      
     );
  }

  Widget createList() {
     return ListView(
       children: [
          ProductItem("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          SizedBox(height: 8,),
          ProductItem("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
          SizedBox(height: 8,),
          ProductItem("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
       ],
     );
  }

}


class ProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  ProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      child:Row(
        children: [
          Image.network(imageURL, width: 78, height: 78, fit: BoxFit.fill,),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text(title, style: TextStyle(fontSize: 14, color: Colors.black),),
             Row(
               children: [
              Image.network(imageURL, width: 25, height: 25, fit: BoxFit.fill,),
             Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey),),
             Text('￥199', style: TextStyle(fontSize: 28, color: Colors.black),),
               ],
             )
           
            ],
          )

        ],
      )
    );
  }
}

//  (
//         children: <Widget>[
//           Text(title, style: TextStyle(fontSize: 24)),
//           Text(desc, style: TextStyle(fontSize: 18)),
//           SizedBox(height: 10,),
//           Image.network(imageURL)
//         ],
//       ),