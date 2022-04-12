//
//  DRRightTCell.swift
//  Cashier
//
//  Created by mac on 2022/4/12.
//

import UIKit

class DRRightTCell: baseTableViewCell {
    
    lazy var backView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FFFFFF")
        return view
    }()
    
    lazy var leftL: UILabel = {
        let label = UILabel()
        label.text = "应收营业额（含记账）"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 21*WidthW)
        return label
    }()
    
    lazy var middleL: UILabel = {
        let label = UILabel()
        label.text = "20000.00"
        label.textColor = UIColor.init(hex: "#323233")
        label.font = UIFont.systemFont(ofSize: 21*WidthW)
        return label
    }()
    lazy var rightL: UILabel = {
        let label = UILabel()
        label.text = "5%"
        label.textColor = UIColor.init(hex: "#FE4B48")
        label.font = UIFont.systemFont(ofSize: 21*WidthW)
        return label
    }()
    
    lazy var imgView: UIImageView = {
        let img = UIImageView()
        imageView?.contentMode = .scaleAspectFit
        img.image = UIImage(named: "dr_up")
        return img
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#E6E8EB")
        return view
    }()
    override func configUI() {
        self.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
        }
        
        self.backView.addSubview(leftL)
        leftL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0)
            make.left.equalTo(self.backView.snp.left).offset(40*WidthW)
//            make.width.equalTo(200*WidthW)
            make.height.equalTo(self.backView)
        }
        self.backView.addSubview(middleL)
        middleL.snp.makeConstraints { make in
//            make.width.equalTo(200*WidthW)
            make.height.equalTo(self.backView.snp.height).offset(0)
            make.center.equalTo(self.backView.snp.center).offset(0)
        }
        
        self.backView.addSubview(rightL)
        rightL.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0)
            make.right.equalTo(self.backView.snp.right).offset(-100*WidthW)
//            make.width.equalTo(100*WidthW)
            make.height.equalTo(self.backView)
        }
        
       
        
        self.backView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.centerY.equalTo(self.backView.snp.centerY).offset(0)
            make.width.height.equalTo(20*WidthW);
            make.left.equalTo(self.rightL.snp.right).offset(10*WidthW)
        }
        
        
        self.backView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.bottom.equalTo(self.backView.snp.bottom).offset(0)
            make.left.equalTo(self.backView.snp.left).offset(20*WidthW)
            make.right.equalTo(self.backView.snp.right).offset(-20*WidthW)
            make.height.equalTo(2*HeighH)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
