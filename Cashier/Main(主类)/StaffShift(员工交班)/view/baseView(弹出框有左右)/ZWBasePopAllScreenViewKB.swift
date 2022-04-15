//
//  ZWRecordLogViewKB.swift
//  Cashier
//
//  Created by mac on 2022/4/14.
//

import UIKit

class ZWBasePopAllScreenViewKB: basePopView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var leftView:ZWRecordLogLeftViewKB = ZWRecordLogLeftViewKB().initView() as! ZWRecordLogLeftViewKB
    var rightView:ZWRecordLogRitghtViewKB = ZWRecordLogRitghtViewKB().initView() as! ZWRecordLogRitghtViewKB
    
    
    
    override func configUI() {
        self.closeBtn.isHidden = true
        self.backView.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: LeftItemWidth*WidthW, bottom: 0, right: 0))
        }
        
        
        self.backView.addSubview(self.leftView)
        leftView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(OrderTabelViewWidth*WidthW)
        }
        self.backView.addSubview(self.rightView)
        rightView.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(self.leftView.snp.right)
        }
        
        self.rightView.backBtnBlock = {() in
            self.closeBtnClick()
            
        }
        
        self.configChildView()
    }
    
    func configChildView() {
        
    }
    

}
