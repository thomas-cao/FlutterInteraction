import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';



class NftModelViewr extends StatefulWidget {
  const NftModelViewr({Key? key}) : super(key: key);

  @override
  State<NftModelViewr> createState() => _NftModelViewrState();
}

class _NftModelViewrState extends State<NftModelViewr> {

 @override
  void initState() {
    super.initState();
  }

final String url = "https://img.tukuppt.com/png_preview/00/03/79/ci3tJWlJ3O.jpg!/fw/780";

 final coverUrl = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F16%2F07%2F04%2F17577a32ae4b66a.jpg%21r650&refer=http%3A%2F%2Fbpic.588ku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634463535&t=5252d12c5a8c898a058005097ce51901";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueGrey,
      height: 430,
      child: Stack(
        children: [
          Image.network(url, width: double.infinity, height: 300,),
          AbsorbPointer(
            child: ModelViewer(
            backgroundColor: Colors.transparent,
            src: 'https://mdn.alipayobjects.com/rms/afts/file/A*7LI7QKjyas4AAAAAAAAAAAAAARQnAQ',
            alt: "A 3D model of an astronaut",
            ar: true,
            autoRotate: true,
            cameraControls: false,
            enablePan: false,
            // 模型显示之前的类似于占位图
            poster: coverUrl,
            posterColor: Colors.blueGrey,
            // skyboxImage: "https://img.tukuppt.com/png_preview/00/03/79/ci3tJWlJ3O.jpg!/fw/780",
          ),
          ),
          
        ],
      ),
    );
  }
}