//
//  header.swift
//  Cashier
//
//  Created by mac on 2022/3/11.
//

import UIKit

import SkeletonView
import Lottie


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

let OrderRightViewWidth  : CGFloat  = 148

let MainColor = UIColor.init(hex: "#FE4B48")//主色
let StandingPColor = UIColor.init(hex: "#EBEDF0")//站位色

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


