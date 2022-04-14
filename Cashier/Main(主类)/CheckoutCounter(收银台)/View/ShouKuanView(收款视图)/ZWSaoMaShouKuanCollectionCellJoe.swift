//
//  ZWSaoMaShouKuanCollectionCellJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/14.
//

import UIKit

class ZWSaoMaShouKuanCollectionCellJoe: UICollectionViewCell {
    
    lazy var QRCodeImage : UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = StandingPColor
        return imageview
    }()
    
    //item 标题
    lazy var TitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "应收金额:￥108:00"
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        return label
    }()
    
    //
    lazy var content01: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "可扫描"
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        return label
    }()
    //
    lazy var content02: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "/等待顾客扫描二维码进行"
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        return label
    }()
    //
    lazy var zhifuBaoBtn: UIButton = {
        let Btn = UIButton()
        Btn.titleLabel!.textAlignment = .left
        Btn.setImage(UIImage.init(named: "订单查询时间"), for: .normal)
        Btn.setTitle("支付宝或", for: .normal)
        Btn.titleLabel!.font = UIFont.systemFont(ofSize: 24*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#969799"), for: .normal)
        return Btn
    }()
    //
    lazy var WechatBtn: UIButton = {
        let Btn = UIButton()
        Btn.titleLabel!.textAlignment = .left
        Btn.setImage(UIImage.init(named: "订单查询时间"), for: .normal)
        Btn.setTitle("微信收款码", for: .normal)
        Btn.titleLabel!.font = UIFont.systemFont(ofSize: 24*WidthW)
        Btn.setTitleColor(UIColor.init(hex: "#969799"), for: .normal)
        return Btn
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
        
        self.backgroundColor = UIColor.clear
        
        //
        self.addSubview(QRCodeImage)
        QRCodeImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(375*WidthW)
        }
        self.addSubview(TitleLabel)
        TitleLabel.snp.makeConstraints { make in
            make.left.equalTo(QRCodeImage.snp.left)
            make.right.equalTo(QRCodeImage.snp.right)
            make.top.equalTo(QRCodeImage.snp.top).offset(-56*HeighH)
            make.height.equalTo(30*HeighH)
        }
        
        TitleLabel.attributedText=attributedtext(text:"应收金额:￥108:00", mainColor:UIColor.init(hex: "#969799"), mainFont:22*WidthW, mainText:"应收金额:", subColor:UIColor.init(hex: "#323233"), subfont:28*WidthW, subText:"￥108:00")
        
        //
        self.addSubview(content01)
        content01.snp.makeConstraints { make in
            make.left.equalTo(QRCodeImage.snp.left)
            make.top.equalTo(QRCodeImage.snp.bottom).offset(40*HeighH)
        }
        //
        self.addSubview(zhifuBaoBtn)
        zhifuBaoBtn.snp.makeConstraints { make in
            make.left.equalTo(content01.snp.right)
            make.centerY.equalTo(content01.snp.centerY)
        }
        //
        self.addSubview(WechatBtn)
        WechatBtn.snp.makeConstraints { make in
            make.centerY.equalTo(content01.snp.centerY)
            make.left.equalTo(zhifuBaoBtn.snp.right)
        }
        //
        self.addSubview(content02)
        content02.snp.makeConstraints { make in
            make.right.equalTo(QRCodeImage.snp.right)
            make.left.equalTo(QRCodeImage.snp.left)
            make.top.equalTo(WechatBtn.snp.bottom).offset(10*WidthW)
        }
    }
    
  
}
