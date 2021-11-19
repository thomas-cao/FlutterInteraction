import 'package:flutter/material.dart';
import 'package:my_flutter/customWidgets/CustomWidget.dart';


class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("自定义组件"),
            backgroundColor: Colors.cyan,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientButton(
                width: 250,
                height: 60,
                colors: [Colors.cyan, Colors.red],
                child: Text("data"), 
                borderRadius: BorderRadius.circular(4),
                onPressed: (){
                  print("按钮点击了");
                },),
                GradientButton(
                width: 250,
                height: 60,
                colors: [Colors.cyan, Colors.red],
                child: Text("data"), 
                borderRadius: BorderRadius.circular(4),
                onPressed: (){
                  print("按钮点击了");
                },),
                GradientButton(
                width: 250,
                height: 60,
                colors: [Colors.cyan, Colors.red],
                child: Text("data"), 
                borderRadius: BorderRadius.circular(4),
                onPressed: (){
                  print("按钮点击了");
                },)
              ],
            ),
            ),
    );
  }
}