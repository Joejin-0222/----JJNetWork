//
//  ZWRecordLogViewKB.swift
//  Cashier
//
//  Created by mac on 2022/4/15.
//

import UIKit

class ZWRecordLogViewKB: ZWBasePopAllScreenViewKB {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var leftTB:ZWRLLeftTBViewKB = ZWRLLeftTBViewKB().initView() as! ZWRLLeftTBViewKB
    
    var rightTB:ZWRecordLogRightViewKB = ZWRecordLogRightViewKB().initView() as! ZWRecordLogRightViewKB
    
    override func configChildView() {
        
        self.leftView.addSubview(self.leftTB)
        self.leftTB.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(self.leftView.HView.snp.bottom).offset(0*WidthW)
            make.right.equalTo(self.leftView.VView.snp.left)
        }
        
        self.rightView.addSubview(self.rightTB)
        self.rightTB.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.rightView.backBtn.snp.bottom).offset(10*WidthW)
        }
       
    }
    
}
