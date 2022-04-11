//
//  ZWCheckSementCellJoe.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/1.
//

import UIKit

class ZWCheckSementCellJoe : UICollectionViewCell {
    
    //item 标题
    lazy var TitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "热卖商品"
        label.font = UIFont.systemFont(ofSize: 24*WidthW)
        label.textColor = UIColor.init(hex: "#969799")
        return label
    }()
    
    lazy var IndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#FE4B48")
        
        return view
    }()
    lazy var verticalView : UIView = {
      
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "#969799")
        
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
        
        self.backgroundColor = UIColor.white
        //
        self.addSubview(TitleLabel)
        TitleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(68*WidthW)
        }
        //
        self.addSubview(IndicatorView)
        IndicatorView.snp.makeConstraints { make in
            make.centerX.equalTo(TitleLabel.snp.centerX)
            make.height.equalTo(6*WidthW)
            make.width.equalTo(48*WidthW)
            make.bottom.equalTo(TitleLabel.snp.bottom)
        }
        //
        self.addSubview(verticalView)
        verticalView.snp.makeConstraints { make in
            make.centerY.equalTo(TitleLabel.snp.centerY)
            make.height.equalTo(24*WidthW)
            make.width.equalTo(1*WidthW)
            make.right.equalTo(self.snp.right)
        }
    }

}
