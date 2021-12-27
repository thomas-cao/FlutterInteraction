//
//  ViewController.swift
//  AppModuleA
//
//  Created by caohaitao on 10/19/2020.
//  Copyright (c) 2020 caohaitao. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 100, width: 80, height: 80)
        btn.backgroundColor = .red
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
    }

    @objc private func buttonClick() {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {return}
        // 创建flutter 页面
        let flutterVc = FlutterViewController(engine: app.flutterEngine, nibName: nil, bundle: nil)
        flutterVc.setFlutterViewDidRenderCallback {
            print("flutter页面开始渲染")
        }
        // 获取消息通道
        let channel = FlutterMethodChannel(name: "flutter/transferMessage", binaryMessenger: flutterVc.binaryMessenger)
        // 监听方法调用 当flutter调用的时候就会来回调这个页面
        // 作为flutter 与原生通信的方法
        channel.setMethodCallHandler {[weak self] (methodCall, result) in
            // 获取flutter 传递过来的数据
//            print("回调过来的数据是 ==\(methodCall.arguments)")
            if methodCall.method == "getName" {
                // 返回给flutter的数据
                result(self?.getName() ?? "")
            } else if methodCall.method == "gotoNewPage" {
                let vc = DetailViewController()
                vc.callback = {
                    self?.sendMessageToFlutter(flutterVc)
                }
                self?.navigationController?.pushViewController(vc, animated: true)
            } else if methodCall.method == "deviceState" {
                self?.setNavigationBarStateFrom(methodCall.arguments as? [String: Any])
            } else if methodCall.method == "canPopFlutterPage" {
                if let nav = self?.navigationController as? MyNavigationController {
                    print("获取的结果是==\(methodCall.arguments)")
                    nav.canPop = (methodCall.arguments as? Bool) ?? false
                }
            }
        }
        self.navigationController?.pushViewController(flutterVc, animated: true)
    }
    // 此种方法有弊端
    // 1 导航栏切换的时候 会有切换显示隐藏导航栏的动作显示
    // 2 导航栏隐藏后 侧滑手势也就失效了
    // 构思第二种方式 重写导航控制器 ，用来处理导航栏隐藏和显示 当控制器为FlutterViewController时就隐藏
    
    private func setNavigationBarStateFrom(_ result: [String: Any]?) {
        guard let key = result, let status = key["result"] as? String else { return}
//        print("当前状态== \(status)")
//        if status == "resumed" {
//            self.navigationController?.setNavigationBarHidden(true, animated: true)
//        } else {
//            self.navigationController?.setNavigationBarHidden(false, animated: true)
//        }
    }
    
    
    private func getName() -> String {
        return "hellow 树"
    }

    private func sendMessageToFlutter(_ flutterVC: FlutterViewController) {
        let basicChannel = FlutterBasicMessageChannel(name: "flutter/sendMessage", binaryMessenger: flutterVC.binaryMessenger)
        basicChannel.sendMessage("原生主动通知flutter")
    }
}

class DetailViewController: UIViewController {
    
    var callback: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 80))
        btn.setTitle("向flutter发送消息", for: .normal)
        btn.addTarget(self, action: #selector(sendMessageToFlutter), for: .touchUpInside)
        view.addSubview(btn)
        
    }
    
    
    @objc private func sendMessageToFlutter() {
        callback?()
    }
}

