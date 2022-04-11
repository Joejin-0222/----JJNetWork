//
//  SelectStoreCollectionViewCell.swift
//  Cashier
//
//  Created by mac on 2022/3/14.
//

import UIKit

class SelectStoreCollectionViewCell: UICollectionViewCell {
        
    lazy var storeView: UIView = {
          let view = UIView()
          view.backgroundColor = UIColor.clear
          view.layer.masksToBounds = true
          view.layer.cornerRadius = 44*HeighH
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
    
    lazy var storeLineView: UIView = {
          let view = UIView()
          view.backgroundColor = UIColor(red: 200/255, green: 201/255, blue: 204/255, alpha: 1)
          return view
    }()
    
   lazy var storeLabel: UILabel = {
          let label = UILabel()
          label.textAlignment = .center
          label.font = UIFont(name: "CN Regular", size: CGFloat(30))
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
        self.addSubview(storeView)
        storeView.addSubview(storeIcon)
        storeView.addSubview(storeLineView)
        storeView.addSubview(storeLabel)
        storeView.addSubview(arrowIcon)
        
        storeView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(88*HeighH)
            make.width.equalTo(472*WidthW)
        }
        
        storeIcon.snp.makeConstraints { make in
            make.left.equalTo(31)
            make.centerY.equalToSuperview()
            make.height.equalTo(56*HeighH)
            make.width.equalTo(56*WidthW)
        }
        storeLineView.snp.makeConstraints { make in
            make.left.equalTo(storeIcon.snp.right).offset(27*WidthW)
            make.centerY.equalTo(storeIcon.snp.centerY)
            make.height.equalTo(28*HeighH)
            make.width.equalTo(1*WidthW)
        }
        
        storeLabel.snp.makeConstraints { make in
            make.left.equalTo(storeLineView.snp.right).offset(27*WidthW)
            make.centerY.equalTo(storeLineView.snp.centerY)
            make.height.equalTo(30*HeighH)
            make.width.equalTo(207*WidthW)
        }
        
        arrowIcon.snp.makeConstraints { make in
            make.right.equalTo(-28*WidthW)
            make.centerY.equalTo(storeLabel.snp.centerY)
            make.height.equalTo(28*HeighH)
            make.width.equalTo(28*WidthW)
        }
    }
}
