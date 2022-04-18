//
//  ZWRecordLogRitghtViewKB.swift
//  Cashier
//
//  Created by mac on 2022/4/15.
//

import UIKit

typealias backBtnBlock = ()->Void

class ZWRecordLogRitghtViewKB: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var backBtnBlock:backBtnBlock?
    
    
    
    lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "返回"), for: .normal)
        button.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        return button
    }()
    //返回按钮点击事件
    @objc func backBtnClick(sender:UIButton){
        if self.backBtnBlock != nil{
            self.backBtnBlock!()
        }
    }
    
    func initView() -> UIView {
        
        self.backgroundColor = Tab_backColor
        
        self.addSubview(self.backBtn)
        backBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(76*WidthW)
            make.left.equalToSuperview().offset(64*WidthW)
            make.height.width.equalTo(92*WidthW)
        }
        
        
        return self
    }
}
