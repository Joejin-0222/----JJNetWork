//
//  ZWLoadingHub.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/12.
//

import UIKit

class ZWLoadingHUD {
    
    static var hudView : ZWLoadingTanKuangView?
    /// 创建Hud
    ///
    /// - Parameters:
    ///   - view: 加载到哪个View展示.
    ///   - isMask: 是否是蒙层形式,背景半透明.
    ///   - isTranslucent: 项目中navigationBar是否计算frame,默认是false,如果项目中有调用self.navigationController?.navigationBar.isTranslucent = true则传入true
    private class func createHud(view : UIView? = UIApplication.shared.keyWindow, isMask : Bool = false ,isTranslucent: Bool = false) -> ZWLoadingTanKuangView? {
        
        let view = ZWLoadingTanKuangView(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        
        hudView = view
//        guard let supview = view ?? UIApplication.shared.keyWindow else {return nil}
////        let HUD = ZWLoadingTanKuangView。
//        let top = isTranslucent ? 0 : EWScreenInfo.navigationHeight
//        HUD.frame = CGRect(x: 0, y: top, width: EWScreenInfo.Width, height: EWScreenInfo.Height - top)
//        HUD.animationType = .zoom
//        if isMask {
//            /// 蒙层type,背景半透明.
//            HUD.backgroundView.color = UIColor(white: 0.0, alpha: 0.4)
//        } else {
//            /// 非蒙层type,没有背景.
//            HUD.backgroundView.color = UIColor.clear
//            HUD.bezelView.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
////            HUD.contentColor = themRedColor
//        }
//        HUD.removeFromSuperViewOnHide = true
//        HUD.show(animated: true)
        return view
    }
  public  func ShowLoading(){
      let  HUD =  ZWLoadingHUD.createHud()
        HUD!.show()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
