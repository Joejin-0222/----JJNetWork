//
//  ZWVIPRightOrderTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/18.
//

import UIKit

class ZWVIPRightOrderTCell: baseTableViewCell {

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
        view.backgroundColor = UIColor.init(hex: "ffffff")
        return view
    }()
    
    lazy var imgView :UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "图标备份 3")
        return img
    }()
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "交易完成"
        label.textColor = UIColor.init(hex: "#646566")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "2021-10-08 17:08:40"
        label.textColor = UIColor.init(hex: "#C8C9CC")
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        return label
    }()
    
    lazy var orderNumL: UILabel = {
        let label = UILabel()
        label.text = "订单编号 438918203712391203"
        label.textColor = UIColor.init(hex: "#646566")
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        return label
    }()
    
    lazy var orderInfo: UILabel = {
        let label = UILabel()
        label.text = "共计2件，实付￥80（会员卡）"
        label.textColor = UIColor.init(hex: "#646566")
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        return label
    }()
    
    override func configUI() {
        self.contentView.addSubview(self.backView)
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        backView.addSubview(self.imgView)
        imgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20*WidthW)
            make.left.equalToSuperview().offset(40*WidthW)
            make.width.height.equalTo(24*WidthW)
        }
        
        backView.addSubview(self.leftLabel)
        leftLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.imgView.snp.centerY)
            make.left.equalTo(self.imgView.snp.right).offset(8*WidthW)
            make.height.equalTo(22*WidthW)
        }
        
        backView.addSubview(self.timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.imgView.snp.centerY)
            make.left.equalTo(self.leftLabel.snp.right).offset(16*WidthW)
        }
        
        backView.addSubview(self.orderNumL)
        orderNumL.snp.makeConstraints { make in
            make.top.equalTo(self.leftLabel.snp.bottom).offset(24*WidthW)
            make.left.equalToSuperview().offset(40*WidthW)
        }
        
        backView.addSubview(self.orderInfo)
        orderInfo.snp.makeConstraints { make in make.top.equalTo(self.leftLabel.snp.bottom).offset(24*WidthW)
            make.right.equalToSuperview().offset(-32*WidthW)
        }
        
    }
    
}
