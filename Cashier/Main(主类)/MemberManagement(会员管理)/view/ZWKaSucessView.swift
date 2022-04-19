//
//  ZWKaSucessView.swift
//  Cashier
//
//  Created by mac on 2022/4/18.
//

import UIKit

class ZWKaSucessView: basePopView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    lazy var  headerImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "图标备份 3")
        return img
    }()
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "开卡成功"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 34*WidthW)
        return label
    }()
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "姓名：吴彦祖"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var phoneLable: UILabel = {
        let label = UILabel()
        label.text = "手机号：1538909890"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var kaLabel: UILabel = {
        let label = UILabel()
        label.text = "卡号：7273283299884738494232"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var kaTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "卡类型：浮光西安会员卡"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.text = "卡内余额：￥100.00"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.text = "（现金钱包¥100.00，赠送钱包¥0.00）"
        label.textColor = UIColor.init(hex: "#969799")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var topupBtn: UIButton = {
        let button = UIButton()
        button.setTitle("立即充值", for: .normal)
        button.setTitleColor((MainColor), for: .normal)
        button.layer.cornerRadius = 36*WidthW
        button.layer.borderColor = MainColor.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32*WidthW ,weight: UIFont.Weight.medium)
        button.addTarget(self, action: #selector(topupBtnClick), for: .touchUpInside)
        return button
    }()
    
    @objc  func topupBtnClick(){
        let topupSuccess:ZWTopupSuccessView = ZWTopupSuccessView().initView() as! ZWTopupSuccessView
        topupSuccess.show()
    }
    
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
        
        self.backView.addSubview(self.nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(64*WidthW)
            make.top.equalToSuperview().offset(330*WidthW)
            make.height.equalTo(28*WidthW)
        }
        self.backView.addSubview(self.phoneLable)
        phoneLable.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(30*WidthW)
            make.width.equalTo(366*WidthW)
            make.top.equalTo(nameLabel.snp.top)
            make.height.equalTo(28*WidthW)
        }
        self.backView.addSubview(self.kaLabel)
        kaLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(40*WidthW)
            make.left.equalToSuperview().offset(64*WidthW)
            make.height.equalTo(28*WidthW)
        }
        self.backView.addSubview(self.kaTypeLabel)
        kaTypeLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(30*WidthW)
            make.width.equalTo(366*WidthW)
            make.top.equalTo(kaLabel.snp.top)
            make.height.equalTo(28*WidthW)
        }
        self.backView.addSubview(self.moneyLabel)
        moneyLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(64*WidthW)
            make.top.equalTo(kaLabel.snp.bottom).offset(40*WidthW)
            make.height.equalTo(28*WidthW)
        }
        self.backView.addSubview(self.tipLabel)
        tipLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(64*WidthW)
            make.top.equalTo(moneyLabel.snp.bottom).offset(40*WidthW)
            make.height.equalTo(28*WidthW)
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
