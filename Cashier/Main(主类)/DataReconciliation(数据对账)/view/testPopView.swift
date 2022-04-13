//
//  testPopView.swift
//  Cashier
//
//  Created by mac on 2022/4/13.
//

import UIKit

class testPopView: basePopView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    lazy var titileL: UILabel = {
        let currentL = UILabel()
        currentL.text = "我是测试数据"
        return  currentL
    }()
    
    override func configUI() {
        self.backView.addSubview(self.titileL)
        self.titileL.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}
