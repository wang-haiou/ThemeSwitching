//
//  ThemeExample.swift
//  EBangKe
//
//  Created by Seagull on 2018/1/15.
//  Copyright © 2018年 Seagull. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum ThemeStyle: String {
    case person  = "person"  //个人
    case company = "company" //企业
}
struct Theme {
    // 用RxSwift定义被观察的对象，并给出默认值
    static var current: Variable<ThemeStyle> = Variable(.person)
    // 可以改变被观察对象的方法
    static func update(_ style: ThemeStyle) {
        self.current.value = style
    }
}

enum ThemeColor: String {
    case hexF2F2F2_000000 = "F2F2F2_000000"
    case hex000000_F5A623 = "000000_F5A623"
    case hexFFFFFF_333333 = "FFFFFF_333333"
    case hexFFFFFF_F5A623 = "FFFFFF_F5A623"
    case hexD3361C_F5A623 = "D3361C_F5A623"
    case hexCCCCCC_333333 = "CCCCCC_333333"
    case hex666666_F5A623 = "666666_F5A623"
    case hex333333_B2B2B2 = "333333_B2B2B2"
    case hexD3361C_B2B2B2 = "D3361C_B2B2B2"
    case hexCCCCCC_797979 = "CCCCCC_797979"
    case hexFFFFFF_383838 = "FFFFFF_383838"
    case hex595959_A4A4A4 = "595959_A4A4A4"
    case hexFFFFFF_212121 = "FFFFFF_212121"
    case hexD8d8d8_666666 = "D8d8d8_666666"
    case hexCCCCCC_666666 = "CCCCCC_666666"
    case hexE5E5E5_333333 = "E5E5E5_333333"
    case hexF2F2F2_212121 = "F2F2F2_212121"
}

extension Theme {
    static func color(_ hexs:ThemeColor)-> UIColor{
        return color(hexs: hexs.rawValue)
    }
    fileprivate static func color(hexs:String)-> UIColor{
        let colors = hexs.components(separatedBy: "_")
        let strColor :String = self.current.value == .company ? "#\(colors[1])":"#\(colors[0])"
        return UIColor.hex(strColor)
    }
    static func image(name:String) -> UIImage! {
        return self.current.value == .company ? UIImage(named: "\(name)s"):UIImage(named: name)
    }
    static func imageNamed(_ name:String) -> String {
        return self.current.value == .company ? "\(name)s":name
    }
    static func text(_ text:String) -> String {
        let texts = text.components(separatedBy: "_")
        
        return self.current.value == .company ? texts[1]:texts[0]
    }
    static func title(_ titles:[String]) -> String {
        return self.current.value == .company ? titles[1]:titles[0]
    }
}

fileprivate let disposeBag = DisposeBag() // 监听者自动销毁器

extension UIView {
    //view的背景颜色
    @IBInspectable var backColors: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.backgroundColor = Theme.color(hexs: newValue)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    //tint颜色
    @IBInspectable var tintColors: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.tintColor = Theme.color(hexs: newValue)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
}

extension UIImageView {
    @IBInspectable var imageNamed: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.image = Theme.image(name: newValue)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
}
extension UILabel {
    //UILabel主要文字颜色
    @IBInspectable var textColors: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.textColor = Theme.color(hexs: newValue)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    
    @IBInspectable var texts: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.text = Theme.text(newValue)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    /*
     @IBInspectable var textss: String{
     set{
     Theme.current.asDriver().map({ (style) -> String in
     let texts = newValue.components(separatedBy: "_")
     
     return style == .company ? texts[1]:texts[0]
     //return Theme.text(newValue)
     }).drive(self.rx.text).disposed(by:disposeBag)
     }
     get{return ""}
     }
     */
}
extension UIButton {
    
    @IBInspectable var titles: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.setTitle(Theme.text(newValue), for: .normal)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    @IBInspectable var titlesSelect: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.setTitle(Theme.text(newValue), for: .selected)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    @IBInspectable var titleColors: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.setTitleColor(Theme.color(hexs: newValue), for: .normal)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    @IBInspectable var titleColorsSelect: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.setTitleColor(Theme.color(hexs: newValue), for: .selected)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    @IBInspectable var image: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.setImage(Theme.image(name: newValue), for: .normal)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    @IBInspectable var imageSelect: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.setImage(Theme.image(name: newValue), for: .selected)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    
    func title(_ titles: [String], for state: UIControlState){
        Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
            self.setTitle(Theme.title(titles), for: state)
        }).disposed(by:disposeBag)
    }
    
    func titleColor(_ color: String, for state: UIControlState){
        Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
            self.setTitleColor(Theme.color(hexs: color), for: state)
        }).disposed(by:disposeBag)
    }
    func backgroundImage(_ name: String, for state: UIControlState){
        Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
            self.setBackgroundImage(Theme.image(name: name), for: state)
        }).disposed(by:disposeBag)
    }
    
    func image(_ name: String, for state: UIControlState){
        Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
            self.setImage(Theme.image(name: name), for: state)
        }).disposed(by:disposeBag)
    }
    
}

extension UITextField {
    @IBInspectable var textColors: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.textColor = Theme.color(hexs: newValue)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    
    @IBInspectable var placeHolderColors: String {
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.setValue(Theme.color(hexs: newValue), forKeyPath: "_placeholderLabel.textColor")
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
}

extension UINavigationBar {
    @IBInspectable var backgroundImages: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.setBackgroundImage(Theme.image(name: newValue), for: UIBarMetrics.default)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    
    @IBInspectable var textColors: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                let dict:NSDictionary = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18),NSAttributedStringKey.foregroundColor: Theme.color(hexs: newValue)]
                //标题设置颜色与字体大小
                self.titleTextAttributes = dict as? [NSAttributedStringKey : Any]
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
}

extension UITabBar {
    @IBInspectable var barTintColors: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.barTintColor = Theme.color(hexs: newValue)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
}

extension UITabBarItem {
    func foreground(color: String, state: UIControlState) {
        Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
            self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:Theme.color(hexs: color)], for: state)
        }).disposed(by:disposeBag)
    }
    
    @IBInspectable var imageNames: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.image = Theme.image(name: newValue).withRenderingMode(.alwaysOriginal)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
    
    @IBInspectable var selectedImageNames: String{
        set{
            Theme.current.asObservable().subscribe(onNext: { (style:ThemeStyle) in
                self.selectedImage = Theme.image(name: newValue).withRenderingMode(.alwaysOriginal)
            }).disposed(by:disposeBag)
        }
        get{return ""}
    }
}


/*
 //fileprivate var themePickersKey = "themePickersKey"
 
 objc_setAssociatedObject(self, &themePickersKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
 
 let key: String = objc_getAssociatedObject(self, &themePickersKey) as! String
 return key
 */
