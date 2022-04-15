//
//  ZWRecordVLogTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/15.
//

import UIKit

class ZWRecordVLogTCell: baseTableViewCell {
    
    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FEE6E5")
        return view
    }()
    
    lazy var titleL: UILabel = {
        let label = UILabel()
        label.text = "总收金额"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var moneyL: UILabel = {
        let label = UILabel()
        label.text = "¥128.00"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var companyL: UILabel = {
        let label = UILabel()
        label.text = "浮光思锦"
        label.textColor = SubTitle_color
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        return label
    }()
    
    lazy var timeL: UILabel = {
        let label = UILabel()
        label.text = "10-04 14:00 至 10-04"
        label.textColor = SubTitle_color
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#E6E8EB")
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    override func configUI() {
        self.backgroundColor = UIColor.init(hex: "#ffffff")
        
        self.addSubview(backView)
        self.backView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0*WidthW)
            make.right.equalTo(self.snp.right).offset(-0*WidthW)
            make.left.equalTo(self.snp.left).offset(0*WidthW)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        self.backView.addSubview(self.titleL)
        titleL.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24*WidthW)
            make.left.equalToSuperview().offset(28*WidthW)
            make.height.equalTo(24*WidthW)
        }
        
        self.backView.addSubview(self.moneyL)
        moneyL.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24*WidthW)
            make.right.equalToSuperview().offset(-28*WidthW)
            make.height.equalTo(24*WidthW)
        }
        
        self.backView.addSubview(self.companyL)
        companyL.snp.makeConstraints { make in
            make.top.equalTo(self.titleL.snp.bottom).offset(20*WidthW)
            make.left.equalToSuperview().offset(28*WidthW)
            make.height.equalTo(20*WidthW)
            
        }
        self.backView.addSubview(self.timeL)
        timeL.snp.makeConstraints { make in
            make.top.equalTo(self.titleL.snp.bottom).offset(20*WidthW)
            make.right.equalToSuperview().offset(-28*WidthW)
            make.height.equalTo(20*WidthW)
        }

        self.backView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.bottom.equalTo(self.backView.snp.bottom).offset(0)
            make.left.equalTo(self.backView.snp.left).offset(20*WidthW)
            make.right.equalTo(self.backView.snp.right).offset(-20*WidthW)
            make.height.equalTo(2*HeighH)
        }
        
    }
    var titleStr: NSString? {
        didSet{
            guard let titleStr = titleStr else { return }
            
        }
    }
    
    var imgStr: NSString? {
        didSet{
            guard let imgStr = imgStr else { return }
            
            
        }
    }
    
    var indexSelected: Int? {
        didSet{
            guard let indexSelected = indexSelected else { return }
            if indexSelected == 1 {
                backView.backgroundColor = UIColor(hex: "#FEE6E5")
            }else{
                backView.backgroundColor = UIColor.white
            }
        }
    }
    

        
    
}
