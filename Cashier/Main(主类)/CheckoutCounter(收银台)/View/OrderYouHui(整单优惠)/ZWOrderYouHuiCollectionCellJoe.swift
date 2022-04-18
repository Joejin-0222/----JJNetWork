//
//  ZWOrderYouHuiCollectionCellJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/15.
//

import UIKit

class ZWOrderYouHuiCollectionCellJoe: UICollectionViewCell {
    
    //item 标题
    lazy var TitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "热卖商品"
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#323233")
        return label
    }()
    //
    lazy var backView : UIView = {
        
        let view = UIView()
        //        view.backgroundColor = UIColor.init(hex: "##EBEDF0")
        
        return view
    }()
    //
    lazy var BackImage : UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage.init(named: "整单优惠背景01")
//        ImageView.contentMode =  .scaleAspectFill
        return ImageView
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
        
        self.backgroundColor = UIColor.white
        
        //
        
//        backView.cornerRadius(cornerRadius: self.height/2, borderColor: UIColor.init(hex: "#EBEDF0"), borderWidth: 1)
        self.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right)
            make.left.equalTo(self.snp.left)
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(self.snp.top)
        }
        backView.addSubview(BackImage)
        BackImage.snp.makeConstraints { make in
            make.right.equalTo(backView.snp.right)
            make.left.equalTo(backView.snp.left)
            make.bottom.equalTo(backView.snp.bottom)
            make.top.equalTo(backView.snp.top)
        }
        //
        backView.addSubview(TitleLabel)
        TitleLabel.snp.makeConstraints { make in
            make.right.equalTo(backView.snp.right).offset(-16*WidthW)
            make.left.equalTo(backView.snp.left).offset(16*WidthW)
            make.bottom.equalTo(backView.snp.bottom)
            make.top.equalTo(backView.snp.top)
        }
        
        
    }
    
}
