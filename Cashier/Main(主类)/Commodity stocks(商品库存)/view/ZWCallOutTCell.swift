//
//  ZWCallOutTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/19.
//

import UIKit

class ZWCallOutTCell: baseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8*WidthW
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hex: "#F3F3F5").cgColor
        view.clipsToBounds = true
        return view
    }()
    
    lazy var headerBackView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#F3F3F5")
        return view
    }()
    
    lazy var imgView :UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "编组 3")
        return img
    }()
    
    lazy var orederNum: UILabel = {
        let label = UILabel()
        label.text = "单号：32324353652112885332"
        label.textColor = UIColor.init(hex: "#535C7A")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    lazy var creatTimeL: UILabel = {
        let label = UILabel()
        label.text = "2021-10-04 14:00:20"
        label.textColor = UIColor.init(hex: "#535C7A")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    
    
    lazy var oldShop: UILabel = {
        let label = UILabel()
        label.text = "玉祥门店"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var arrowsImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "编组 15备份 2")
        return img
    }()
    
    lazy var newShop: UILabel = {
        let label = UILabel()
        label.text = "大都荟店"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 28*WidthW)
        return label
    }()
    
    lazy var confimBtm: UIButton = {
        let button = UIButton()
        button.setTitle("确认出库", for: .normal)
        button.setTitleColor(UIColor.init(hex: "#ffffff"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20*WidthW)
        button.backgroundColor = MainColor
        button.layer.cornerRadius = 24*WidthW
        return button
    }()
    
    lazy var timeImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "编组 16")
        return img
    }()
    
    lazy var expectLabel: UILabel = {
        let label = UILabel()
        label.text = "期望送达时间：2022-02-24 17:48:00"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var associatedLabel: UILabel = {
        let label = UILabel()
        label.text = "关联上级单号：1238849600323819390"
        label.textColor = UIColor.init(hex: "#969799")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    override func configUI() {
        
        self.contentView.addSubview(self.backView)
        backView.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 12*WidthW, left: 72*WidthW, bottom: -12*WidthW, right:-72*WidthW ))
            make.top.equalToSuperview().offset(12*WidthW)
            make.right.equalToSuperview().offset(-72*WidthW)
            make.left.equalToSuperview().offset(72*WidthW)
            make.bottom.equalToSuperview().offset(-12*WidthW)
        }
        
        backView.addSubview(self.headerBackView)
        headerBackView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.height.equalTo(64*WidthW)
            make.right.equalToSuperview()
        }
        
        headerBackView.addSubview(self.imgView)
        imgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(40*WidthW)
            make.width.height.equalTo(32*WidthW)
        }
        
        headerBackView.addSubview(self.orederNum)
        orederNum.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(imgView.snp.right).offset(16*WidthW)
            make.height.equalTo(20*WidthW)
        }
        
        headerBackView.addSubview(self.creatTimeL)
        creatTimeL.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(headerBackView.snp.right).offset(-28*WidthW)
            make.height.equalTo(20*WidthW)
        }
       

        backView.addSubview(self.oldShop)
        oldShop.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(32*WidthW)
            make.top.equalTo(headerBackView.snp.bottom).offset(32*WidthW)
            make.height.equalTo(28*WidthW)
        }

        backView.addSubview(self.arrowsImg)
        arrowsImg.snp.makeConstraints { make in
            make.centerY.equalTo(oldShop.snp.centerY)
            make.left.equalTo(oldShop.snp.right).offset(18*WidthW)
            make.width.equalTo(32*WidthW)
            make.height.equalTo(22*WidthW)
        }

        backView.addSubview(self.newShop)
        newShop.snp.makeConstraints { make in
            make.centerY.equalTo(oldShop.snp.centerY)
            make.left.equalTo(arrowsImg.snp.right).offset(18*WidthW)
        }

        backView.addSubview(self.confimBtm)
        confimBtm.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-32*WidthW)
            make.top.equalTo(headerBackView.snp.bottom).offset(28*WidthW)
            make.width.equalTo(160*WidthW)
            make.height.equalTo(48*WidthW)
        }

        backView.addSubview(self.timeImg)
        timeImg.snp.makeConstraints { make in
            make.top.equalTo(oldShop.snp.bottom).offset(21*WidthW)
            make.left.equalTo(oldShop.snp.left)
            make.width.height.equalTo(26*WidthW)
        }

        backView.addSubview(self.expectLabel)
        expectLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeImg.snp.centerY)
            make.left.equalTo(self.timeImg.snp.right).offset(10*WidthW)
            make.height.equalTo(24*WidthW)
        }

        backView.addSubview(self.associatedLabel)
        associatedLabel.snp.makeConstraints { make in
            make.left.equalTo(self.oldShop.snp.left)
            make.top.equalTo(self.timeImg.snp.bottom).offset(19*WidthW)
            make.height.equalTo(20*WidthW)
        }
    }
}
