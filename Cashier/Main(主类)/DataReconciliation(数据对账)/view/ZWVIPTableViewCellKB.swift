//
//  ZWVIPTableViewCellKB.swift
//  Cashier
//
//  Created by mac on 2022/4/24.
//

import UIKit

class ZWVIPTableViewCellKB: baseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var titleArr:NSArray = ["总会员数","新增会员","30天活跃会员"]
    

    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    
    override func configUI() {
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.addSubview(self.backView)
        backView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(72*WidthW)
            make.right.equalToSuperview().offset(-72*WidthW)
        }
        
        
        for num in 0..<3 {
            let backView1 = UIView()
            backView1.layer.cornerRadius = 10*WidthW;
            backView1.backgroundColor = UIColor.white
            backView1.layer.borderColor = UIColor.init(hex: "#EBEDF0").cgColor
            backView1.layer.borderWidth = 1
            backView.addSubview(backView1)
            if num == 0 {
                backView1.snp.makeConstraints { make in
                    make.left.top.bottom.equalToSuperview()
                    make.width.equalTo(368*WidthW)
                }
            }else if num == 1{
                backView1.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.width.equalTo(368*WidthW)
                    make.top.bottom.equalToSuperview()
                }
            }else if num == 2{
                backView1.snp.makeConstraints { make in
                    make.right.equalToSuperview()
                    make.width.equalTo(368*WidthW)
                    make.top.bottom.equalToSuperview()
                }
            }
        
            let label1:UILabel = UILabel()
            label1.text = titleArr[num] as? String
            label1.textColor = Title_color
            label1.font(UIFont.systemFont(ofSize: 22*WidthW))
            backView1.addSubview(label1)
            label1.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(52*WidthW)
            }
            
            let label2:UILabel = UILabel()
            label2.text = "0"
            label2.textColor = Title_color
            label2.font(UIFont.systemFont(ofSize: 36*WidthW,weight: UIFont.Weight.bold))
            backView1.addSubview(label2)
            label2.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(label1.snp.bottom).offset(16*WidthW)
            }
            
        }
    }
    
    
}
