//
//  ZWSuccessionTCellKB.swift
//  Cashier
//
//  Created by mac on 2022/4/14.
//

import UIKit

enum ZWSuccessionTCellStyle {
    case none       //全部显示
    case onlyLeft   //只显示右边
    case onelyRed   //除了明细都显示
    case onelyTow   //只显示左右，不显示中间的
}

class ZWSuccessionTCellKB: baseTableViewCell {

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
        view.backgroundColor = UIColor.init(hex: "#F3F3F5")
        return view
    }()
    
    
    lazy var leftL: UILabel = {
        let label = UILabel()
        label.text = "销售金额/元"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var totalL: UILabel = {
        let label = UILabel()
        label.text = "共计100单"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    lazy var detailBtn: UIButton = {
        let dBtn = UIButton()
        dBtn.setTitleColor(UIColor.init(hex: "#FE4B48"), for: .normal)
        dBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20*WidthW)
//        dBtn.setTitle("明细", for: .normal)
//        dBtn.setImage(UIImage(named: "编组"), for: .normal)
        dBtn.setImageAndTitle(imageName: "编组", title: "明细", type: .PositionRight, Space: 5*WidthW)
        return dBtn
    }()
    
   
    
    lazy var rightL: UILabel = {
        let label = UILabel()
        label.text = "26840.00"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    override func configUI() {
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        }
        
        self.backView.addSubview(self.leftL)
        self.leftL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0)
            make.left.equalTo(self.backView.snp.left).offset(40*WidthW)
            make.height.equalTo(self.backView)
        }
        
        self.backView .addSubview(self.totalL)
        self.totalL.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(leftL.snp.right).offset(10*WidthW)
            make.height.equalTo(30*WidthW)
        }
        
        self.backView.addSubview(self.detailBtn)
        self.detailBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(totalL.snp.right).offset(10*WidthW)
            make.height.equalTo(30*WidthW)
        }
        
        self.backView.addSubview(self.rightL)
        self.rightL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0)
            make.right.equalTo(self.backView.snp.right).offset(-70*WidthW)
            make.height.equalTo(self.backView)
        }
        
        
    }
    
    var style: ZWSuccessionTCellStyle = .none{
        didSet{
            switch style{
            case .none:
                totalL.isHidden = false
                detailBtn.isHidden = false
                rightL.isHidden = false
                backView.backgroundColor = UIColor.white
                leftL.font = UIFont.systemFont(ofSize: 24*WidthW, weight: UIFont.Weight.regular)
            case .onlyLeft:
                totalL.isHidden = true
                detailBtn.isHidden = true
                rightL.isHidden = true
                backView.backgroundColor = UIColor.init(hex: "#F3F3F5")
                leftL.font = UIFont.systemFont(ofSize: 24*WidthW, weight: UIFont.Weight.medium)
            case .onelyRed:
                totalL.isHidden = false
                detailBtn.isHidden = true
                rightL.isHidden = false
                backView.backgroundColor = UIColor.white
                leftL.font = UIFont.systemFont(ofSize: 24*WidthW, weight: UIFont.Weight.regular)
            case .onelyTow:
                totalL.isHidden = true
                detailBtn.isHidden = true
                rightL.isHidden = false
                backView.backgroundColor = UIColor.white
                leftL.font = UIFont.systemFont(ofSize: 24*WidthW, weight: UIFont.Weight.regular)
            }
            
        }
    }
    
    
}
