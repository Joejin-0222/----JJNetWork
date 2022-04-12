//
//  ZWLoadingTanKuangView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/12.
//

import UIKit
import Lottie

class ZWLoadingTanKuangView: UIView {
    
    
    lazy var loadingView: AnimationView = {
        let lot = AnimationView()
        //        let bundle = Bundle(for: BrokersViewController.self)
        //        let animation = Animation.named("气泡弹窗", bundle: bundle)
        let animation  = Animation.named("loading")
        //加载本地json
        lot.animation = animation
        // 加载网络json
        //            if let url = URL (string: "https://brokersshow.oss-cn-shenzhen.aliyuncs.com/dev/files/2020/4/21/hccGradeIcon.json") {
        //                Animation.loadedFrom(url: url, closure: { (an) in
        //                    lot.animation = an
        //                }, animationCache: nil)
        //            }
        lot.contentMode = .scaleAspectFill // 填充模式
        lot.loopMode = .playOnce // 动画播放次数
        lot.backgroundBehavior = .pauseAndRestore // 后台模式
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTapSendCardImgView(_:)))
        //        lot.isUserInteractionEnabled = true
        //        lot.addGestureRecognizer(tap)
        return lot
    }()
    
    let bgView = UIView() //白色框动画控件
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat ) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        
        createAlertView()
        
    }
    
    //MARK:创建
    func createAlertView() {
        ProgressHUD.hideHud()
        //布局
        // self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
       
        self.addSubview(loadingView)
        loadingView.backgroundColor = UIColor.white
        loadingView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(400*WidthW)
        }
        loadingView.play()
       
    }
    
    
    func SelectIndexPathClick(IndexPath: Int, model: ZWCheckSementModelJoe) {
        
    }
    //MARK:消失
    @objc func dismiss() {
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.bgView.alpha = 0
            self.alpha = 0
        }, completion: { (finish) -> Void in
            if finish {
                self.removeFromSuperview()
            }
        })
    }
    /** 指定视图实现方法 */
    func show() {
        let wind = UIApplication.shared.keyWindow
        self.alpha = 0
        
        wind?.addSubview(self)
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            self.alpha = 1
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
