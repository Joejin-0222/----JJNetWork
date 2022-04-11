//
//  iconButtonView.swift
//  Cashier
//
//  Created by mac on 2022/3/15.
//

import UIKit

class iconButtonView: UIView {

    lazy var bgView: UIView = {
          let view = UIView()
          return view
    }()
    
    lazy var logoView: UIImageView = {
          let view = UIImageView()
          view.contentMode = .scaleAspectFill
        return view;
    }()
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "CN Medium", size: CGFloat(14))
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    func initView() -> UIView {
        self.addSubview(bgView)
        bgView.addSubview(logoView)
        bgView.addSubview(titleLabel)
        
        logoView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        logoView.snp.makeConstraints { make in
            make.top.equalTo(29*HeighH)
            make.centerX.equalToSuperview()
            make.width.equalTo(40*WidthW)
            make.height.equalTo(40*HeighH)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(8*HeighH)
            make.centerX.equalTo(logoView.snp.centerX)
            make.height.equalTo(14*HeighH)
            make.width.equalTo(43*WidthW)
        }

        return self
    }
    

}

extension iconButtonView {
    //没有点击时候的样子
    func noneTitleAndImageView(title:String,image:UIImage,textColor:UIColor){
        titleLabel.text = title
        logoView.image = image
        titleLabel.textColor = textColor
    }
}
