//
//  UBaseViewController.swift
//  EBangKe
//
//  Created by Seagull on 2017/9/29.
//  Copyright © 2017年 Seagull. All rights reserved.
//

import UIKit

class UBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        configUI()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    
    func configUI() {
        view.backColors = ThemeColor.hexF2F2F2_212121.rawValue
    }
    
    func loadData() {}
    
    func configNavigationBar() {
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                // 返回按钮
                let btnBack = UIButton(type: .custom)
                if #available(iOS 11.0,*){
                    btnBack.widthAnchor.constraint(equalToConstant: 36).isActive = true
                    btnBack.heightAnchor.constraint(equalToConstant: 34).isActive = true
                }else {
                    btnBack.frame.size = CGSize(width: 36, height: 34)
                }
                btnBack.imageEdgeInsets = UIEdgeInsets(top: 8, left: 14, bottom: 8, right: 12)
                // 给按钮设置返回箭头图片
                btnBack.image("back", for: .normal)
                btnBack.image("back", for: .highlighted)
                btnBack.contentHorizontalAlignment = .left
                btnBack.addTarget(self, action: #selector(pressBack), for: .touchUpInside)
                
                // 自定义导航栏的UIBarButtonItem类型的按钮
                let backView = UIBarButtonItem(customView: btnBack)
                
                // 返回按钮设置成功
                navigationItem.leftBarButtonItem = backView
            }
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension UBaseViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
