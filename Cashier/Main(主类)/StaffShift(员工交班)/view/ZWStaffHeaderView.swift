//
//  ZWStaffHeaderView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/8.
//

import UIKit

class ZWStaffHeaderView: UIView {
//头像
    lazy var headImage :UIImageView = {
      let imageview = UIImageView()
        imageview.backgroundColor = StandingPColor
        return imageview
    }()
    //名称
    lazy var nameLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        label.text = "美玲"
        return label
    }()
    //账号
    lazy var AcountLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        label.textColor = UIColor.init(hex: "#576080")
        label.text = "fgzj"
        return label
    }()

   
    func initView()->UIView{
   
        self.addSubview(headImage)
        headImage.snp.makeConstraints { make in
            make.left.equalTo(37*WidthW)
            make.top.equalTo(37*WidthW)
            make.width.height.equalTo(88*WidthW)
        }
        headImage.cornerRadius(cornerRadius: 44*WidthW)
        //
        
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(headImage.snp.right).offset(35*WidthW)
            make.top.equalTo(headImage.snp.top)
        }
        //
        self.addSubview(AcountLabel)
        AcountLabel.snp.makeConstraints { make in
            make.left.equalTo(headImage.snp.right).offset(35*WidthW)
            make.bottom.equalTo(headImage.snp.bottom)
        }

        
        return self
    }

}
