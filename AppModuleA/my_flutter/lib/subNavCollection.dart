import 'package:flutter/material.dart';

class SubNavCollection extends StatelessWidget {
  const SubNavCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: _getItems(),
            ),
            const SizedBox(height: 10,),
            Row(
               children: _getItems(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getItems() {
      return [
        _item(0),
         _item(1),
          _item(2),
           _item(3),
            _item(4),
        ];
  }

  Widget _item(int index) {
     return Expanded(
       child: Column(
         children: [
           Icon(Icons.paid_outlined),
           SizedBox(height: 2,),
           Text("itajjhdhdhehjjjjem$index")
         ],)
     );
  }

}