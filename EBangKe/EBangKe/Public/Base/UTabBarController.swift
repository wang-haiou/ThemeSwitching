//
//  UTabBarController.swift
//  EBangKe
//
//  Created by Seagull on 2017/9/29.
//  Copyright © 2017年 None. All rights reserved.
//

import UIKit
import RxSwift

class UTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .gray
        tabBar.isTranslucent = false
        tabBar.barTintColors = ThemeColor.hexF2F2F2_212121.rawValue
        
        initTabBarController()
        
    }
    
    func initTabBarController() {
        /// 首页
        let homeVC = UHomeViewController()
        addChildViewController(homeVC,
                               title: "首页",
                               image: "首页",
                               selectedImage: "首页选中")
        
        
        /// 理财
        let financialVC = UFinancialViewController()
        addChildViewController(financialVC,
                               title: "理财",
                               image: "理财",
                               selectedImage: "理财选中")
        
        
        /// 我的
        let mineVC = UMineViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: "我的",
                               selectedImage: "我的选中")
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:String ,selectedImage:String) {
        
        childController.title = title
       
        childController.tabBarItem.title = title
        
        childController.tabBarItem.imageNames = image
        
        childController.tabBarItem.selectedImageNames = selectedImage
        
        childController.tabBarItem.foreground(color: ThemeColor.hex666666_F5A623.rawValue, state: .normal)

        childController.tabBarItem.foreground(color: ThemeColor.hexD3361C_F5A623.rawValue, state: .selected)
        
        addChildViewController(UNavigationController(rootViewController: childController))
    }
    
}

extension UTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
