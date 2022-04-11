//
//  ZWCheckOutStoreCellJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/3/31.
//

import UIKit

class ZWCheckOutStoreCellJoe: UICollectionViewCell {
    
    lazy var storeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5*HeighH
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
        return view
    }()
    
    lazy var storeIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "login_store")
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    
    lazy var TitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "栗栗小熊柏油蛋糕"
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        return label
    }()
    //库存
    lazy var KuCunLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "库存:100"
        label.font = UIFont.systemFont(ofSize: 14*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        return label
    }()
    //价格
    lazy var PriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "￥18.22"
        label.font = UIFont.systemFont(ofSize: 18*WidthW)
        label.textColor = UIColor.init(hex: "#323232")
        return label
    }()
    
    lazy var arrowIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "login_arrow")
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        //
        self.addSubview(storeView)
        storeView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(self.snp.height)
            make.width.equalTo(self.snp.width)
        }
        //
        storeView.addSubview(storeIcon)
        storeIcon.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(self.snp.width)
            make.width.equalTo(self.snp.width)
        }
        
        //
        storeView.addSubview(TitleLabel)
        TitleLabel.snp.makeConstraints { make in
            make.left.equalTo(storeIcon.snp.left).offset(10*WidthW)
            make.right.equalTo(storeIcon.snp.right).offset(-10*WidthW)
            make.height.equalTo(25*HeighH)
            make.top.equalTo(storeIcon.snp.bottom).offset(10*WidthW)
        }
        //
        self.addSubview(KuCunLabel)
        KuCunLabel.snp.makeConstraints { make in
            make.left.equalTo(storeIcon.snp.left).offset(10*WidthW)
            //            make.right.equalTo(storeIcon.snp.right).offset(-10*WidthW)
            make.height.equalTo(25*HeighH)
            make.top.equalTo(TitleLabel.snp.bottom).offset(10*WidthW)
        }
        //
        self.addSubview(PriceLabel)
        PriceLabel.snp.makeConstraints { make in
            //            make.left.equalTo(storeIcon.snp.left).offset(10*WidthW)
            make.right.equalTo(storeIcon.snp.right).offset(-10*WidthW)
            make.height.equalTo(25*HeighH)
            make.top.equalTo(TitleLabel.snp.bottom).offset(10*WidthW)
        }
        
    }
    
}
