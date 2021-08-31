import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.pink),
    home: HHHomePage(),
  ));
}

class HHHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HHHomePageState();
}

class _HHHomePageState extends State<HHHomePage> with WidgetsBindingObserver {
  // 从原生页面获取数据
  static const plaform = const MethodChannel("flutter/transferMessage");
  var _message = "页面内容";
  // 获取原生消息
  static const basicChannel =
      const BasicMessageChannel("flutter/sendMessage", StandardMessageCodec());

  // 初始化state时调用
  @override
  void initState() {
    super.initState();
    basicChannel.setMessageHandler(_recevierMessage);
    // 开始监听 WidgetsBindingObserver 事件
    WidgetsBinding.instance?.addObserver(this);
  }

  // 监听原生发来的消息
  Future _recevierMessage(message) async {
    print('收到native的消息${message}');
  }

  // 获取页面切换的状态
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setDeviceStateMessage(state);
  }

// 当State对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /**
   *   在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
   * 然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。
   * 正如之前所述，Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，
   * 也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
   * 父组件发生 build 的情况下，子组件该方法才会被调用，其次该方法调用之后一定会再调用本组件中的 build 方法。
   * 
   */
  @override
  void didUpdateWidget(covariant HHHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  // 永久移除组件，并释放组件资源。
  @override
  void dispose() {
    super.dispose();
    // 移除监听者
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 150,
        height: 200,
        color: Colors.cyan,
        child: Center(
          child: Text(
            _message,
            style: TextStyle(color: Colors.blue, fontSize: 28),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getDeviceEventMessage();
        },
      ),
    );
  }

  void getDeviceEventMessage() async {
    // 获取原生对应函数的数据
    // final String result = await plaform.invokeMethod("getName", {"result": "我是名称"});
    // setState(() {
    //   _message = result;
    // });

    plaform.invokeMethod("gotoNewPage");
  }

  void setDeviceStateMessage(AppLifecycleState state) async {
    var stateStr = "-";
    if (state == AppLifecycleState.resumed) {
      stateStr = "resumed";
    } else if (state == AppLifecycleState.inactive) {
      stateStr = "inactive";
    } else if (state == AppLifecycleState.paused) {
      stateStr = "paused";
    } else if (state == AppLifecycleState.detached) {
      stateStr = "detached";
    }
    plaform.invokeMethod("deviceState", {"result": stateStr});
  }
}
