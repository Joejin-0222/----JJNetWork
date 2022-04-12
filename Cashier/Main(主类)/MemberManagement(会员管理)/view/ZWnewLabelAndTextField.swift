//
//  ZWnewLabelAndTextField.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/12.
//

import UIKit

class ZWnewLabelAndTextField: UIView {
    //
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        return label
    }()
    //
    
    lazy var textField : UITextField = {
        let textField = UITextField()
        return textField
    }()
    func initView()->UIView{
        //
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.width.equalTo(116*WidthW)
            make.height.equalTo(22*WidthW)
        }
        //
        self.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.equalTo(textField.snp.right).offset(22*WidthW)
            make.top.equalTo(self.snp.top)
            make.width.equalTo(360*WidthW)
            make.height.equalTo(64*WidthW)
        }
        
        
        return self
    }
    
}
