//
//  ZWMoneyInfoCCellKB.swift
//  Cashier
//
//  Created by mac on 2022/4/14.
//

import UIKit

class ZWMoneyInfoCCellKB: ZWBaseCollectionViewCell {
    
    lazy var imgView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "支付宝支付备份 2(2)")
        return img
    }()
    
    lazy var typeL: UILabel = {
        let label = UILabel()
        label.text = "现金（元）"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
     
    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var moneyL: UILabel = {
        let label = UILabel()
        label.text = "￥2055"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 32*WidthW)
        return label
    }()
    
    lazy var numberL: UILabel = {
        let label = UILabel()
        label.text = "4笔"
        label.textColor = UIColor.init(hex: "#969799")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    
    override func configUI() {
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor .clear
        
        self.contentView.addSubview(self.imgView)
        self.imgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(35*WidthW)
            make.left.equalToSuperview().offset(20*WidthW)
            make.width.height.equalTo(32*WidthW)
        }
        
        self.contentView.addSubview(self.typeL)
        self.typeL.snp.makeConstraints { make in
            make.centerY.equalTo(self.imgView.snp.centerY).offset(0)
            make.left.equalTo(self.imgView.snp.right).offset(5*WidthW)
        }
        
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { make in
            make.top.equalTo(self.imgView.snp.bottom).offset(15*WidthW)
            make.left.equalToSuperview().offset(10*WidthW)
            make.width.equalToSuperview().offset(-20*WidthW)
            make.height.equalTo(120*WidthW)
        }
        
        self.backView.addSubview(self.moneyL)
        self.moneyL.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(28*WidthW)
            make.height.equalTo(32*WidthW)
        }
        
        self.backView.addSubview(self.numberL)
        self.numberL.snp.makeConstraints { make in
            make.top.equalTo(self.moneyL.snp.bottom).offset(15*WidthW)
            make.left.equalTo(self.moneyL.snp.left).offset(0)
            make.height.equalTo(20*WidthW)
        }
    }
}
