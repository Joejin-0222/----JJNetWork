//
//  ZWOrderWeighView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/12.
//

import UIKit

class ZWOrderWeighView: UIView {

    
    lazy var weighLabel : UILabel = {
       let label = UILabel()
        label.text = "*称重"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    func  initView()->UIView{
        
        self.addSubview(weighLabel)
        weighLabel.snp.makeConstraints { make in
            make.left.equalTo(16*WidthW)
            make.width.equalTo(61*WidthW)
            make.height.equalTo(20*WidthW)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        
        return self
    }
}
