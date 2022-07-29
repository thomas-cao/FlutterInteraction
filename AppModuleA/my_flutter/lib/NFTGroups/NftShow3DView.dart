import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class NftShow3DView extends StatefulWidget {
  NftShow3DView({Key? key}) : super(key: key);

  @override
  State<NftShow3DView> createState() => _NftShow3DViewState();
}

class _NftShow3DViewState extends State<NftShow3DView>
    with SingleTickerProviderStateMixin {
  late Scene _scene;
  Object? _objt;
  late AnimationController _controller;
  double _ambient = 0.1;
  double _diffuse = 0.8;
  double _specular = 0.5;
  double _shininess = 0.0;


@override
  void initState() {
    super.initState();
   _controller = AnimationController(duration: Duration(milliseconds: 30000), vsync: this)
      ..addListener(() {
        if (_objt != null) {
          _objt!.rotation.y = _controller.value * 360;
          _objt!.updateTransform();
          _scene.update();
        }
      })
      ..repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      height: 380,
      child: AbsorbPointer(child: Cube(onSceneCreated: _onScenCreated)),
    );
  }

  void _onScenCreated(Scene scene) {
    _scene = scene;
    scene.camera.position.z = 8;
    scene.light.position.setFrom(Vector3(0, 10, 10));
    scene.light.setColor(Colors.white, _ambient, _diffuse, _specular);
    _objt = Object(position: Vector3(0, -3.0, 0), 
    scale: Vector3(10.0, 10.0, 10.0), 
    lighting: true, fileName: "assets/images/bunny.obj",
    normalized: true,
    );
    // 是否显示模型
    _objt?.visiable = true;
    _objt?.backfaceCulling = true;
    scene.world.add(_objt!);
  }
}
