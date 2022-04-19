//
//  ZWVIPConsumptionRecordView.swift
//  Cashier
//
//  Created by mac on 2022/4/18.
//

import UIKit

class ZWVIPConsumptionRecordView: ZWBasePopAllScreenViewKB {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    lazy var titleL: UILabel = {
        let label = UILabel()
        label.text = "会员卡消费记录"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var redLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FE4B48")
        return view
    }()
    
    var leftTB:ZWVIPCRLeftView = ZWVIPCRLeftView().initView() as! ZWVIPCRLeftView
    
    var rightTB:ZWVIPCRRightView = ZWVIPCRRightView().initView() as! ZWVIPCRRightView
    
    override func configChildView() {
        self.leftView.snp.remakeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(673*WidthW)
        }
        
        self.leftView.addSubview(self.leftTB)
        self.leftTB.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(self.leftView.HView.snp.bottom).offset(0*WidthW)
            make.right.equalTo(self.leftView.VView.snp.left)
        }
        
        self.rightView.addSubview(self.titleL)
        self.titleL.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(102*WidthW)
            make.centerX.equalToSuperview()
            make.height.equalTo(28*WidthW)
        }
        
        
        self.rightView.addSubview(self.redLineView)
        redLineView.snp.makeConstraints { make in
            make.top.equalTo(self.titleL.snp.bottom).offset(14*WidthW)
            make.centerX.equalToSuperview()
            make.width.equalTo(32*WidthW)
            make.height.equalTo(4*WidthW)
        }
                
        self.rightView.addSubview(self.rightTB)
        self.rightTB.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.rightView.backBtn.snp.bottom).offset(10*WidthW)
        }
       
    }
}
