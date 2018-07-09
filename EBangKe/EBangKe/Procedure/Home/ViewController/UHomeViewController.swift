//
//  UHomeViewController.swift
//  EBangKe
//
//  Created by Seagull on 2017/12/27.
//  Copyright © 2017年 Seagull. All rights reserved.
//

import UIKit

class UHomeViewController: UBaseViewController {

    var isB = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(btn)
        view.addSubview(imageV)
        view.addSubview(lab)
        view.addSubview(tf)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isB {
            isB = false
            Theme.update(.company)
        }else{
            isB = true
            Theme.update(.person)
        }
    }
    
    private lazy var btn: UIButton = {
        let btn = UIButton()
        btn.frame.size = CGSize(width: 200, height: 50)
        btn.center = CGPoint(x: view.center.x, y: 70)
        btn.setTitle("button", for: .normal)
        btn.titleColors = ThemeColor.hexFFFFFF_383838.rawValue
        btn.backColors = ThemeColor.hexD3361C_F5A623.rawValue
        return btn
    }()
    private lazy var imageV: UIImageView = {
        let imaV = UIImageView()
        imaV.frame.size = CGSize(width: 200, height: 50)
        imaV.center = CGPoint(x: view.center.x, y: 170)
        imaV.imageNamed = "BackgroundNav"
        return imaV
    }()
    private lazy var lab: UILabel = {
        let lab = UILabel()
        lab.frame.size = CGSize(width: 200, height: 50)
        lab.center = CGPoint(x: view.center.x, y: 270)
        lab.text = "label"
        lab.textAlignment = .center
        lab.textColors = ThemeColor.hexFFFFFF_383838.rawValue
        lab.backColors = ThemeColor.hexD3361C_F5A623.rawValue
        return lab
    }()
    private lazy var tf: UITextField = {
        let tf = UITextField()
        tf.frame.size = CGSize(width: 200, height: 50)
        tf.center = CGPoint(x: view.center.x, y: 370)
        tf.text = "UITextField"
        tf.textAlignment = .center
        tf.textColors  = ThemeColor.hexFFFFFF_383838.rawValue
        tf.backColors = ThemeColor.hexD3361C_F5A623.rawValue
        return tf
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
