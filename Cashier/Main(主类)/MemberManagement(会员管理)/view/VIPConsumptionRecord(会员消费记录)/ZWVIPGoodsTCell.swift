//
//  ZWVIPGoodsTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/18.
//

import UIKit

class ZWVIPGoodsTCell: baseTableViewCell {

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
        img.image = UIImage(named: "蛋糕2")
        return img
    }()
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "栗栗小熊柏油蛋糕栗栗小熊柏油榛子坚果脆皮"
        label.textColor = UIColor.init(hex: "#646566")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var moneyL: UILabel = {
        let label = UILabel()
        label.text = "¥80.00"
        label.textColor = UIColor.init(hex: "#C8C9CC")
        label.font = UIFont.systemFont(ofSize: 18*WidthW,weight: UIFont.Weight.medium)
        return label
    }()
    
    lazy var goodsNumL: UILabel = {
        let label = UILabel()
        label.text = "x3"
        label.textColor = UIColor.init(hex: "#969799")
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
            make.top.equalToSuperview().offset(12*WidthW)
            make.left.equalToSuperview().offset(40*WidthW)
            make.width.height.equalTo(64*WidthW)
        }
        
        backView.addSubview(self.leftLabel)
        leftLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imgView.snp.top).offset(2*WidthW)
            make.left.equalTo(self.imgView.snp.right).offset(16*WidthW)
            
        }
        
        backView.addSubview(self.moneyL)
        moneyL.snp.makeConstraints { make in
            make.centerY.equalTo(self.leftLabel.snp.centerY)
            make.right.equalToSuperview().offset(-48*WidthW)
        }
        
        backView.addSubview(self.goodsNumL)
        goodsNumL.snp.makeConstraints { make in
            make.bottom.equalTo(self.imgView.snp.bottom).offset(-2*WidthW)
            make.left.equalTo(self.imgView.snp.right).offset(16*WidthW)
        }
        
    }
}
