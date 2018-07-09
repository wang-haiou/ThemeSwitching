//
//  ViewController.swift
//  EBangKe
//
//  Created by Seagull on 2017/12/27.
//  Copyright © 2017年 Seagull. All rights reserved.
//

import UIKit

class ViewController: UBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            Theme.update(.person)//当前主题类型
        }else{
            Theme.update(.company)//当前主题类型
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
