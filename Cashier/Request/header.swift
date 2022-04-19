//
//  header.swift
//  Cashier
//
//  Created by mac on 2022/3/11.
//

import UIKit

import SkeletonView
import Lottie
import Kingfisher


let userDefault = UserDefaults.standard


var glt_iphoneX: Bool {
    if #available(iOS 11.0, *) {
        return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0 > 0
    } else {
        return false
    }
}

let GLT_STATUSHEIGHT = UIApplication.shared.statusBarFrame.size.height

let GLT_BOTTOMSPACE: CGFloat = glt_iphoneX ? 34 : 0

let GLT_NAVCHEIGHT: CGFloat = GLT_STATUSHEIGHT >= 44 ? 88 : 64

//设备物理尺寸
let ScreenHeight = UIScreen.main.bounds.size.height
let ScreenWidth = UIScreen.main.bounds.size.width
//比例适配
let HeighH = ScreenHeight/1080
let WidthW = ScreenWidth/1920

let LeftItemWidth : CGFloat = 128

let OrderTabelViewWidth : CGFloat  = 525

let OrderRightViewWidth  : CGFloat  = 152

let MainColor = UIColor.init(hex: "#FE4B48")//主色
let StandingPColor = UIColor.init(hex: "#EBEDF0")//站位色
let LineColor = UIColor.init(hex: "#E4E7E7")//灰色分割线颜色
let Tab_backColor = UIColor.init(hex: "#FAFAFA")//tableView的背景颜色
let Title_color = UIColor.init(hex: "#323233")//文字主要的颜色
let SubTitle_color = UIColor.init(hex: "#646566")//浅灰色文字的颜色


// MARK: 字体
func CN_Medium(_ size:Float)->UIFont{
    return UIFont(name: "CN Medium", size: CGFloat(size))!
}

// MARK: UIView中直接实现页面跳转(即如何在子视图中获取其父视图控制器的方法)
func nextResponder(currentView:UIView) -> UIViewController {
    var vc:UIResponder = currentView
    while vc.isKind(of: UIViewController.self) != true {
        vc = vc.next!
    }
    return vc as! UIViewController
}
//富文本设置字体大小颜色
func attributedtext(text:String,mainColor:UIColor,mainFont:CGFloat,mainText:String,subColor:UIColor,subfont:CGFloat,subText:String) ->NSMutableAttributedString{
    
    let attrstring:NSMutableAttributedString = NSMutableAttributedString(string:text)
    let str = NSString(string: text)
    let theRange = str.range(of: mainText)
    attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value: mainColor, range: theRange)
    attrstring.addAttribute(NSAttributedString.Key.font, value:UIFont.systemFont(ofSize: mainFont), range: theRange)
    let theSubRange = str.range(of: subText)
    attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value: subColor, range: theSubRange)
    attrstring.addAttribute(NSAttributedString.Key.font, value:UIFont.systemFont(ofSize: subfont), range: theSubRange)
    return attrstring
    
}
