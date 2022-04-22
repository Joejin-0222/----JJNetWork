//
//  ZWFinancialTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/22.
//

import UIKit

class ZWFinancialTCell: baseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    lazy var bigBackView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hex: "#E6E8EB").cgColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#F3F3F5")
        return view
    }()
    
    lazy var whiteView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#ffffff")
        return view
    }()
    
    lazy var oneL: UILabel = {
        let label = UILabel()
        label.text = "订单笔数"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var towL: UILabel = {
        let label = UILabel()
        label.text = "有效订单数"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    lazy var thirdL: UILabel = {
        let label = UILabel()
        label.text = "应收营业额"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var fourL: UILabel = {
        let label = UILabel()
        label.text = "实收营业额"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    lazy var fiveL: UILabel = {
        let label = UILabel()
        label.text = "实收净额"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        return label
    }()
    
    override func configUI() {
        self.backgroundColor = UIColor.clear
        self.contentView.isHidden = true
        self.addSubview(bigBackView)
        bigBackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 72*WidthW, bottom: 0, right: 72*WidthW))
        }
        
        bigBackView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(75*WidthW)
        }
        
        bigBackView.addSubview(whiteView)
        whiteView.snp.makeConstraints { make in
            make.bottom.right.left.equalToSuperview()
            make.height.equalTo(75*WidthW)
        }
        
        self.backView.addSubview(oneL)
        oneL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0)
            make.left.equalTo(self.backView.snp.left).offset(30*WidthW)
            make.height.equalTo(self.backView)
        }
        
        self.backView.addSubview(thirdL)
        thirdL.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        self.backView.addSubview(towL)
        towL.snp.makeConstraints { make in
            make.height.equalTo(self.backView.snp.height).offset(0)
            make.centerX.equalTo(thirdL.snp.centerX).multipliedBy(0.5)
            make.centerY.equalToSuperview()
        }
        
        self.backView.addSubview(fourL)
        fourL.snp.makeConstraints { make in
            make.centerX.equalTo(thirdL.snp.centerX).multipliedBy(1.5)
            make.height.equalToSuperview()
        }
        
        self.backView.addSubview(fiveL)
        fiveL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0)
            make.right.equalTo(self.backView.snp.right).offset(-30*WidthW)
            make.height.equalToSuperview()
        }
        
        for i in 0...4 {
            print("=====",i)
            let label:UILabel = UILabel()
            label.text = "222"
            label.textColor = Title_color
            label.font = UIFont.systemFont(ofSize: 24*WidthW)
            whiteView.addSubview(label)
            label.snp.makeConstraints { make in
                make.height.equalToSuperview()
                if i == 0{
                    make.centerX.equalTo(oneL.snp.centerX)
                }else if i == 1{
                    make.centerX.equalTo(towL.snp.centerX)
                }else if i == 2{
                    make.centerX.equalTo(thirdL.snp.centerX)
                }else if i == 3{
                    make.centerX.equalTo(fourL.snp.centerX)
                }else if i == 4{
                    make.centerX.equalTo(fiveL.snp.centerX)
                }
            }
            
            
        }
        
    }
    

}
