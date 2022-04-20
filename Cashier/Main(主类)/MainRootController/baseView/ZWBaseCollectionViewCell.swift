//
//  ZWBaseCollectionViewCell.swift
//  Cashier
//
//  Created by mac on 2022/4/14.
//

import UIKit
import Reusable

class ZWBaseCollectionViewCell: UICollectionViewCell,Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}
