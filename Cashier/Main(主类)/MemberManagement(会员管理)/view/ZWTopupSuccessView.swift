//
//  ZWTopupSuccessView.swift
//  Cashier
//
//  Created by mac on 2022/4/18.
//

import UIKit
import MapKit

class ZWTopupSuccessView: basePopView {

    lazy var  headerImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "图标备份 3")
        return img
    }()
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "充值成功"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 34*WidthW)
        return label
    }()
    
    lazy var currentLabel: UILabel = {
        let label = UILabel()
        label.text = "当前总余额：¥24.00"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var tipLable1: UILabel = {
        let label = UILabel()
        label.text = "（现金钱包¥200.00，增值钱包¥4.00）"
        label.textColor = UIColor.init(hex: "#969799")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var topupLabel: UILabel = {
        let label = UILabel()
        label.text = "本次充值：￥100.00"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var tipLabel2: UILabel = {
        let label = UILabel()
        label.text = "（支付¥100.00，赠送¥0.00）"
        label.textColor = UIColor.init(hex: "#969799")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var topupBtn: UIButton = {
        let button = UIButton()
        button.setTitle("确定", for: .normal)
        button.setTitleColor((MainColor), for: .normal)
        button.layer.cornerRadius = 36*WidthW
        button.layer.borderColor = MainColor.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32*WidthW ,weight: UIFont.Weight.medium)
        return button
    }()
    
    override func configUI() {
        
        self.backView.addSubview(self.headerImg)
        headerImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(68*WidthW)
            make.width.equalTo(96*WidthW)
            make.height.equalTo(96*WidthW)
        }
        self.backView.addSubview(self.headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(184*WidthW)
            make.height.equalTo(34*WidthW)
        }
        
        self.backView.addSubview(self.currentLabel)
        currentLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(68*WidthW)
            make.top.equalTo(self.headerLabel.snp.bottom).offset(104*WidthW)
            make.height.equalTo(32*WidthW)
        }
        
        self.backView.addSubview(self.tipLable1)
        tipLable1.snp.makeConstraints { make in
            make.left.equalTo(self.currentLabel.snp.left)
            make.top.equalTo(self.currentLabel.snp.bottom).offset(24*WidthW)
            make.height.equalTo(32*WidthW)
            
        }
        
        self.backView.addSubview(self.topupLabel)
        topupLabel.snp.makeConstraints { make in
            make.top.equalTo(self.tipLable1.snp.bottom).offset(80*WidthW)
            make.left.equalToSuperview().offset(68*WidthW)
            make.height.equalTo(32*WidthW)
        }
        
        self.backView.addSubview(self.tipLabel2)
        tipLabel2.snp.makeConstraints { make in
            make.top.equalTo(self.topupLabel.snp.bottom).offset(24*WidthW)
            make.left.equalTo(self.topupLabel)
            make.height.equalTo(32*WidthW)
        }
        
        self.backView.addSubview(self.topupBtn)
        topupBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-56*WidthW)
            make.width.equalTo(240*WidthW)
            make.height.equalTo(72*WidthW)
        }
    }

}
