//
//  ZWOrderYouHuiHeaderCellJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/15.
//

import UIKit

class ZWOrderYouHuiHeaderCellJoe: ZWBaseCollectionViewCell {
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = MainColor
        return view
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.text = "整单折扣"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupUI(){
        self.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.width.equalTo(4*WidthW)
            make.height.equalTo(22*WidthW)
            make.top.equalTo(self.snp.top).offset(24*WidthW)
        }
        //
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(lineView.snp.right).offset(9*WidthW)
            make.centerY.equalTo(lineView.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-30*WidthW)
            make.height.equalTo(26*WidthW)
        }
        
    }
}
