//
//  ZWVIPLeftTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/18.
//

import UIKit
import MapKit



class ZWVIPLeftTCell: baseTableViewCell {

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
        img.image = UIImage(named: "编组 3")
        return img
    }()
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "姓名："
        label.textColor = UIColor.init(hex: "#646566")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var rightL: UILabel = {
        let label = UILabel()
        label.text = "浮光西安会员卡"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.text = "（现金钱包¥100.00，赠送钱包¥0.00）"
        label.textColor = UIColor.init(hex: "#969799")
        label.font = UIFont.systemFont(ofSize: 16*WidthW)
        label.isHidden = true
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#E6E8EB")
        return view
    }()
    
    override func configUI() {
        
        self.contentView.addSubview(self.backView)
        backView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        backView.addSubview(self.imgView)
        imgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(36*WidthW)
            make.width.height.equalTo(32*WidthW)
        }
        
        backView.addSubview(self.leftLabel)
        leftLabel.snp.makeConstraints { make in
            make.left.equalTo(self.imgView.snp.right).offset(16*WidthW)
            make.centerY.equalToSuperview()
        }
        
        backView.addSubview(self.rightL)
        rightL.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-40*WidthW)
            make.centerY.equalToSuperview()
        }
        
        
        self.backView.addSubview(self.lineView)
        lineView.snp.makeConstraints { make in
            make.bottom.equalTo(self.backView.snp.bottom).offset(0)
            make.left.equalTo(self.backView.snp.left).offset(20*WidthW)
            make.right.equalTo(self.backView.snp.right).offset(-20*WidthW)
            make.height.equalTo(2*HeighH)
        }
        
        self.backView.addSubview(self.tipLabel)
        self.tipLabel.snp.makeConstraints { make in
            make.top.equalTo(self.rightL.snp.bottom).offset(8*WidthW)
            make.right.equalTo(self.rightL.snp.right)
        }
        
    }
    var tipHidden:Bool?  {
        didSet{
            guard let tipHidden = tipHidden else {
                return
            }
            if tipHidden {
                self.tipLabel.isHidden = !tipHidden
                self.rightL.textColor = MainColor
                self.lineView.isHidden = tipHidden
            }else{
                self.tipLabel.isHidden = !tipHidden
                self.rightL.textColor = Title_color
            }
        }
    }
    
}
