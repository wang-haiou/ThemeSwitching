//
//  UNavigationController.swift
//  EBangKe
//
//  Created by Seagull on 2017/9/29.
//  Copyright © 2017年 Seagull. All rights reserved.
//

import UIKit

class UNavigationController: UINavigationController,UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false
        self.interactivePopGestureRecognizer?.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = true
        
        self.navigationBar.backgroundImages = "BackgroundNav"
        
        self.navigationBar.textColors = ThemeColor.hexFFFFFF_F5A623.rawValue
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 { viewController.hidesBottomBarWhenPushed = true }
        super.pushViewController(viewController, animated: animated)
    }
}

extension UNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let topVC = topViewController else { return .lightContent }
        return topVC.preferredStatusBarStyle
    }
}
