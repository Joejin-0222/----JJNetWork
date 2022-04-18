//
//  ZWRecordLogLeftViewKB.swift
//  Cashier
//
//  Created by mac on 2022/4/15.
//

import UIKit

class ZWRecordLogLeftViewKB: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
//    顶部的logo
    lazy var logImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "商家logo")
        return img
    }()
    //水平线
    lazy var HView:UIView = {
        let view = UIView()
        view.backgroundColor = LineColor
        return view
    }()
    //竖着的线
    lazy var VView:UIView = {
        let view = UIView()
        view.backgroundColor = LineColor
        return view
    }()
    
    
    func initView() -> UIView {
        
//        self.backgroundColor = MainColor
        
        self.addSubview(self.VView)
        VView.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        
        self.addSubview(self.logImg)
        logImg.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(40*WidthW)
//            make.width.equalToSuperview().offset(-10*WidthW)
            make.width.equalTo(179*WidthW)
            make.left.equalTo(self.snp.left).offset(20*WidthW)
            make.height.equalTo(30*WidthW)
        }
        
        self.addSubview(self.HView)
        HView.snp.makeConstraints { make in
            make.top.equalTo(self.logImg.snp.bottom).offset(27*WidthW)
            make.left.equalToSuperview()
            make.height.equalTo(1*WidthW)
            make.right.equalTo(self.VView.snp.left)
        }
        
       
        
        return self
    }

}
