//
//  ZWOrderYouHuiPopViewJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/14.
//

import UIKit

class ZWOrderYouHuiPopViewJoe: basePopView {

    
     let cancelBtn = UIButton() //取消按钮
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "整单优惠"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        return label
    }()
    
     override func configUI() {
         self.createAlertView()
     }
     
     //MARK:创建
     func createAlertView() {
         //
         self.backView.snp.remakeConstraints { make in
             make.left.equalTo((LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW)
             make.width.equalTo(ScreenWidth - (LeftItemWidth + OrderRightViewWidth + OrderTabelViewWidth)*WidthW)
             make.height.equalTo(ScreenHeight)
         }
         //
         //取消按钮 返回按钮
         cancelBtn.frame = CGRect(x: 63*WidthW, y: 70*WidthW, width: 92*WidthW, height: 92*WidthW)
         cancelBtn.setTitleColor(UIColor.white, for: .normal)
         cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
         cancelBtn.layer.cornerRadius = 3
         cancelBtn.clipsToBounds = true
         cancelBtn.tag = 1
         cancelBtn.setImage(UIImage.init(named: "返回"), for: .normal)
         cancelBtn.addTarget(self, action: #selector(closeBtnClick), for: .touchUpInside)
         self.backView.addSubview(cancelBtn)
         
         //
         self.backView.addSubview(titleLabel)
         titleLabel.snp.makeConstraints { make in
//             make.left.equalTo(cancelBtn.snp)
         }
         
     }
}
