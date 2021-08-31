//
//  MyNavigationController.swift
//  AppModuleA_Example
//
//  Created by 曹海涛 on 2021/8/30.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Flutter

class MyNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let popGesture = interactivePopGestureRecognizer {
            popGesture.delegate = self
            self.delegate = self
        }
    }
    
    
}

extension MyNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if (viewController as? FlutterViewController) != nil {
            self.setNavigationBarHidden(true, animated: animated)
        } else {
            self.setNavigationBarHidden(false, animated: animated)
        }
        print("当前页面 ==\(viewController)")
        
    }
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let popGesture = self.interactivePopGestureRecognizer {
            popGesture.isEnabled = self.viewControllers.count != 1
        }
    }
}

extension MyNavigationController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
         return true
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.viewControllers.count <= 1 {return false}
        return true
    }
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIScreenEdgePanGestureRecognizer {
            otherGestureRecognizer.require(toFail: gestureRecognizer)
        }
        return gestureRecognizer is UIScreenEdgePanGestureRecognizer
    }
}
