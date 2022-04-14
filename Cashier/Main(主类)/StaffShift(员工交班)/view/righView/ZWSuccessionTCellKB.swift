//
//  ZWSuccessionTCellKB.swift
//  Cashier
//
//  Created by mac on 2022/4/14.
//

import UIKit

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
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var totalL: UILabel = {
        let label = UILabel()
        label.text = "共计100单"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 20*WidthW)
        return label
    }()
    
    lazy var detailBtn: UIButton = {
        let dBtn = UIButton()
        dBtn.setTitleColor(UIColor.init(hex: "#FE4B48"), for: .normal)
        dBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20*WidthW)
        dBtn.setTitle("明细", for: .normal)
        dBtn.setImage(UIImage(named: "编组"), for: .normal)
//        dBtn.setImageAndTitle(imageName: "编组", title: "明细", type: .PositionRight, Space: 5*WidthW)
        dBtn.addTarget(self, action: #selector(detailBtnClick), for: .touchUpInside)
        return dBtn
    }()
    
    @objc func detailBtnClick(sender: UIButton){
        print("sender")
    }
    
    lazy var rightL: UILabel = {
        let label = UILabel()
        label.text = "26840.00"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    override func configUI() {
        self.addSubview(self.backView)
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
    
    
}
