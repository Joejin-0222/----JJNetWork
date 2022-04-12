//
//  ZWLeftItemCellJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/30.
//

import UIKit

class ZWLeftItemCellJoe: UICollectionViewCell {
    
    
    lazy var LeftItemView: UIView = {
        let view = UIView()
        view.backgroundColor = MainColor
        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 1
//        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor (red: 235/255, green: 237/255, blue: 240/255, alpha: 1).cgColor
        return view
    }()
    
    lazy var LeftItemIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "收银台")
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
  
    lazy var LeftItemLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22*WidthW)
        label.textColor = UIColor.init(hex: "#FFFFFF")
//        label.backgroundColor = UIColor.blue
        return label
    }()
    
//    var indexPath = IndexPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
       
     
        //地图view
        self.addSubview(LeftItemView)
        LeftItemView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(self.snp.height)
            make.width.equalTo(self.contentView.snp.width)
        }
    
        //标题图标
        
        LeftItemView.addSubview(LeftItemIcon)
        
//        if indexPath.row == 0{
//            LeftItemIcon.snp.makeConstraints { make in
//                make.top.equalTo(16*WidthW)
//                make.centerX.equalTo(self.contentView.snp.centerX)
//                make.width.height.equalTo(62*WidthW)
//            }
//        }else{
            LeftItemIcon.snp.makeConstraints { make in
                make.top.equalTo(16*WidthW)
                make.centerX.equalTo(self.contentView.snp.centerX)
                make.width.height.equalTo(56*WidthW)
//            }
        }
        
     
        print("====\(56*WidthW)")
        
          
        //标题
        LeftItemView.addSubview(LeftItemLabel)
        LeftItemLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.height.equalTo(30*WidthW)
            make.top.equalTo(LeftItemIcon.snp.bottom).offset(8*WidthW)
            make.width.equalTo(150*WidthW)
        }
      
    }
   
}
