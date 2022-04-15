//
//  ZWSuccessionPopView.swift
//  Cashier
//
//  Created by mac on 2022/4/14.
//

import UIKit

class ZWSuccessionPopView: basePopView {

    
    lazy var titleL: UILabel = {
        let label = UILabel()
        label.text = "交班确认"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 34*WidthW)
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        return label
    }()
    
    lazy var centerImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "编组 2")
        return img
    }()
    
    lazy var contentL: UILabel = {
        let label = UILabel()
        label.text = "确定交班并退出系统？"
        label.textColor = Title_color
        label.font = UIFont.systemFont(ofSize: 32*WidthW)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cancelBtn: UIButton = {
        let button = UIButton()
        button.setTitle("取消", for: .normal)
        button.setTitleColor(UIColor.init(hex: "#FE4B48"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28*WidthW)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.init(hex: "#FE4B48").cgColor
        button.layer.cornerRadius = 34*WidthW
        button.addTarget(self, action: #selector(cancelClick), for: .touchUpInside)
        return button
    }()
    
    lazy var confirmBtn: UIButton = {
        let button = UIButton()
        button.setTitle("确定", for: .normal)
        button.backgroundColor = UIColor.init(hex: "#FE4B48")
        button.setTitleColor(UIColor.init(hex: "#ffffff"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28*WidthW)
        button.layer.cornerRadius = 34*WidthW
        button.addTarget(self, action: #selector(confirmBtnClick), for: .touchUpInside)
        return button
    }()
    
    @objc func cancelClick(){
        print("取消")
        self.closeBtnClick()
    }
    @objc func confirmBtnClick(){
        print("确定")
        self.closeBtnClick()
    }
    
    override func configUI() {
        
        backView.backgroundColor = UIColor.init(hex: "#F5F5F5")
        
        self.backView.addSubview(self.titleL)
        titleL.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(96*WidthW)
            
        }
        self.backView.addSubview(self.centerImg)
        centerImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.titleL.snp.bottom).offset(75*WidthW)
            make.width.equalTo(286*WidthW)
            make.height.equalTo(255*WidthW)
        }
        self.backView.addSubview(self.contentL)
        contentL.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.centerImg.snp.bottom).offset(49*WidthW)
            make.left.equalTo(70*WidthW)
            make.right.equalTo(-70*WidthW)
            
        }
        self.backView.addSubview(self.cancelBtn)
        cancelBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalTo(self.backView.snp.bottom).offset(-88*WidthW)
            make.width.equalTo(228*WidthW)
            make.height.equalTo(68*WidthW)
            
        }
        
        self.backView.addSubview(self.confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.bottom.equalTo(self.backView.snp.bottom).offset(-88*WidthW)
            make.width.equalTo(228*WidthW)
            make.height.equalTo(68*WidthW)
        }
        
        
    }
    var contentStr:NSString? {
        didSet{
            guard let contentStr = contentStr else {
                return
            }
            self.contentL.text = contentStr as! String
        }
    }
    var imgStr:NSString?{
        didSet{
            guard let imgStr = imgStr else {
                return
            }
            centerImg.image = UIImage(named: imgStr as! String)
        }
    }
}
