//
//  ZWRecordLogHeaderViewKB.swift
//  Cashier
//
//  Created by mac on 2022/4/15.
//

import UIKit

class ZWRecordLogHeaderViewKB: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //整个背景
    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FEF9D5")
        view.layer.cornerRadius = 24*WidthW
        return view
    }()
    //左边的view
    lazy var subLeftView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        view.layer.borderColor = UIColor.init(hex: "#FFDA47").cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 24*WidthW
        return view
    }()
    
    lazy var headerImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "aodio")
        return img
    }()
    //角色
    lazy var typeL: UILabel = {
        let label = UILabel()
        label.text = "收银员"
        label.textColor = UIColor.init(hex: "#ffffff")
        label.font = UIFont.systemFont(ofSize: 12*WidthW)
        label.backgroundColor = UIColor.init(hex: "#535C7A")
        label.layer.cornerRadius = 11*WidthW
        return label
    }()
    
    //工作时间
    lazy var headerShow: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.init(hex: "#664A0C"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16*WidthW)
        button.setImageAndTitle(imageName: "编组 13备份", title: "7h40min", type: .Positionleft, Space: 10)
        button.backgroundColor = UIColor.init(hex: "#FFDA47")
        button.layer.cornerRadius = 20*WidthW
        return button
    }()
    //店铺名称
    lazy var shopL: UILabel = {
        let label = UILabel()
        label.text = "浮光思锦"
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 20*WidthW ,weight: UIFont.Weight.medium)
        return label
    }()
    
    // 人名
    lazy var nameL: UILabel = {
        let label = UILabel()
        label.text = "Aio17004"
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 18*WidthW,weight: UIFont.Weight.regular)
        return label
    }()
    
    lazy var upImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "编组 21备份")
        return img
    }()
    
    lazy var upLabel: UILabel = {
        let label = UILabel()
        label.text = "上班时间：2021-10-04 14:00:27"
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    lazy var downImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "编组 21备份 2")
        return img
    }()
    
    lazy var downLabel: UILabel = {
        let label = UILabel()
        label.text = "下班时间：2021-10-04 14:00:27"
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    lazy var lineLeft:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#F5E493")
        return view
    }()
    
    lazy var upFirstTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "首单时间：10:00:27"
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textAlignment = .center
        return label
    }()
    
    lazy var downFirstTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "尾单时间：10:00:27"
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textAlignment = .center
        return label
    }()

    
    lazy var lineRight:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#F5E493")
        return view
    }()
    
    lazy var upFirstNumLabel: UILabel = {
        let label = UILabel()
        label.text = "订单笔数：：110"
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textAlignment = .center
        return label
    }()
    
    lazy var downFirstNumLabel: UILabel = {
        let label = UILabel()
        label.text = "预订单笔数：129"
        label.textColor = UIColor.init(hex: "#5C2B00")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        label.textAlignment = .center
        return label
    }()
    
    func initView()->UIView{
        
        
        self.addSubview(self.backView)
        backView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10*WidthW)
        }
        
        
        self.backView.addSubview(self.subLeftView)
        subLeftView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(8*WidthW)
            make.width.equalTo(160*WidthW)
            make.bottom.equalToSuperview().offset(-8*width)
        }
        
        self.subLeftView.addSubview(self.headerImg)
        headerImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34*WidthW)
            make.width.height.equalTo(48*WidthW)
            make.centerX.equalToSuperview()
        }
        
        self.subLeftView.addSubview(self.typeL)
        typeL.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.headerImg.snp.bottom).offset(2*WidthW)
            make.height.equalTo(22*WidthW)
        }
        
        self.subLeftView.addSubview(self.headerShow)
        headerShow.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-26*WidthW)
            make.left.equalToSuperview().offset(16*WidthW)
            make.right.equalToSuperview().offset(-16*WidthW)
            make.height.equalTo(40*WidthW)
        }
        
        self.backView.addSubview(self.shopL)
        shopL.snp.makeConstraints { make in
            make.left.equalTo(self.subLeftView.snp.right).offset(48*WidthW)
            make.top.equalToSuperview().offset(58*WidthW)
            make.height.equalTo(20*WidthW)
        }

        self.backView.addSubview(self.nameL)
        nameL.snp.makeConstraints { make in
            make.centerY.equalTo(self.shopL.snp.centerY)
            make.left.equalTo(self.shopL.snp.right).offset(24*WidthW)
            make.height.equalTo(20*WidthW)
        }

        self.backView.addSubview(self.upImg)
        upImg.snp.makeConstraints { make in
            make.left.equalTo(self.shopL.snp.left)
            make.top.equalTo(self.shopL.snp.bottom).offset(36*WidthW)
            make.width.height.equalTo(20*WidthW)
        }
        self.backView.addSubview(self.upLabel)
        upLabel.snp.makeConstraints { make in
            make.left.equalTo(self.upImg.snp.right).offset(4*WidthW)
            make.centerY.equalTo(self.upImg.snp.centerY)
        }

        self.backView.addSubview(self.downImg)
        downImg.snp.makeConstraints { make in
            make.left.equalTo(self.shopL.snp.left)
            make.top.equalTo(self.upImg.snp.bottom).offset(20*WidthW)
            make.width.height.equalTo(20*WidthW)
        }
        self.backView.addSubview(self.downLabel)
        downLabel.snp.makeConstraints { make in
            make.left.equalTo(self.downImg.snp.right).offset(4*WidthW)
            make.centerY.equalTo(self.downImg.snp.centerY)
        }

        self.backView.addSubview(self.lineLeft)
        lineLeft.snp.makeConstraints { make in
            make.left.equalTo(self.subLeftView.snp.right).offset(436*WidthW)
            make.bottom.equalToSuperview().offset(-36*WidthW)
            make.width.equalTo(1*WidthW)
            make.height.equalTo(64*WidthW)
        }
        
        self.backView.addSubview(self.lineRight)
        lineRight.snp.makeConstraints { make in
            make.left.equalTo(self.lineLeft.snp.right).offset(292*WidthW)
            make.bottom.equalToSuperview().offset(-36*WidthW)
            make.width.equalTo(1*WidthW)
            make.height.equalTo(64*WidthW)
        }

        self.backView.addSubview(self.upFirstTimeLabel)
        upFirstTimeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.upImg.snp.centerY)
            make.left.equalTo(self.lineLeft.snp.right).offset(5*WidthW)
            make.right.equalTo(self.lineRight.snp.left).offset(-5*WidthW)
            make.height.equalTo(20*WidthW)
        }

        self.backView.addSubview(self.downFirstTimeLabel)
        downFirstTimeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.downImg.snp.centerY)
            make.left.equalTo(self.lineLeft.snp.right).offset(5*WidthW)
            make.right.equalTo(self.lineRight.snp.left).offset(-5*WidthW)
            make.height.equalTo(20*WidthW)
        }
//
        self.backView.addSubview(self.upFirstNumLabel)
        upFirstNumLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.upImg.snp.centerY)
            make.right.equalTo(self.backView.snp.right).offset(-5*WidthW)
            make.left.equalTo(self.lineRight.snp.right).offset(5*WidthW)
            make.height.equalTo(20*WidthW)
        }

        self.backView.addSubview(self.downFirstNumLabel)
        downFirstNumLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.downImg.snp.centerY)
            make.right.equalTo(self.backView.snp.right).offset(-5*WidthW)
            make.left.equalTo(self.lineRight.snp.right).offset(5*WidthW)
            make.height.equalTo(20*WidthW)
        }
        
        
        return self
    }
    
    var isShow:Bool?{
        didSet{
            guard let isShow = isShow else {
                return
            }
            self.downFirstNumLabel.isHidden = isShow
            self.upFirstNumLabel.isHidden = isShow
            self.lineRight.isHidden = isShow
        }
    }
}

