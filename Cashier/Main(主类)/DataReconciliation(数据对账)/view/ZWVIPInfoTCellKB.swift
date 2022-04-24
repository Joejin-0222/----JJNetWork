//
//  ZWVIPInfpTCellKB.swift
//  Cashier
//
//  Created by mac on 2022/4/24.
//

import UIKit

enum cellType{
    case backColor
    case hasRightL
    case normal
}

class ZWVIPInfoTCellKB: baseTableViewCell {

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
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()
    
    lazy var titleL: UILabel = {
        let label = UILabel()
        label.text = "会员明细"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 21*WidthW)
        return label
    }()
    
    lazy var rightL: UILabel = {
        let label = UILabel()
        label.text = "￥23"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW,weight: UIFont.Weight.semibold)
        return label
    }()
    
    lazy var rightL1: UILabel = {
        let label = UILabel()
        label.text = "女 60%"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 21*WidthW,weight: UIFont.Weight.regular)
        label.isHidden = true
        return label
    }()
    lazy var rightL2: UILabel = {
        let label = UILabel()
        label.text = "男 60%"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 21*WidthW,weight: UIFont.Weight.regular)
        label.isHidden = true
        return label
    }()
    
    override func configUI() {
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(72*WidthW)
            make.right.equalToSuperview().offset(-72*WidthW)
        }
        
        backView.addSubview(self.titleL)
        titleL.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40*WidthW)
            make.top.bottom.equalToSuperview()
        }
        
        backView.addSubview(self.rightL)
        rightL.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-46*WidthW)
            make.top.bottom.equalToSuperview()
        }
        
        backView.addSubview(self.rightL1)
        rightL1.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-46*WidthW)
            make.top.bottom.equalToSuperview()
        }
        
        backView.addSubview(self.rightL2)
        rightL2.snp.makeConstraints { make in
            make.right.equalTo(self.rightL1.snp.left).offset(-82*WidthW)
            make.top.bottom.equalToSuperview()
        }
        
    }
    
    var cellType :cellType?{
        didSet{
            guard let cellType = cellType else {
                return
            }
            switch cellType {
            case .normal:
                backView.backgroundColor = UIColor.white
                rightL.isHidden = false
                rightL1.isHidden = true
                rightL2.isHidden = true
            case .backColor:
                
                backView.backgroundColor = UIColor.init(hex: "#F3F3F5")
                rightL.isHidden = true
                rightL1.isHidden = true
                rightL2.isHidden = true
            case .hasRightL:
                backView.backgroundColor = UIColor.white
                rightL.isHidden = true
                rightL1.isHidden = false
                rightL2.isHidden = false
            }
        }
    }
    
    
    
    
}
