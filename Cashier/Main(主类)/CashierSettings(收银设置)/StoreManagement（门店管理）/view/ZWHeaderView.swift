//
//  ZWHeaderView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/7.
//

import UIKit

class ZWHeaderView: UIView {

    lazy var lineView : UIView = {
       let view = UIView()
        view.backgroundColor = MainColor
        return view
    }()
    
    lazy var titleLabel : UILabel = {
      let label = UILabel()
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 22*WidthW)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initView() ->UIView{
        //
        self.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.equalTo(73*WidthW)
            make.width.equalTo(4*WidthW)
            make.height.equalTo(22*WidthW)
            make.top.equalTo(10*WidthW)
        }
        
        //
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(lineView.snp.right).offset(9*WidthW)
            make.centerY.equalTo(lineView.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-30*WidthW)
            make.height.equalTo(26*WidthW)
        }
        
        return self
    }
    

}
