//
//  ZWOrderQuerySearchView.swift
//  Cashier
//
//  Created by IOS FOR Joe on 2022/4/12.
//

import UIKit

class ZWOrderQuerySearchView: UIView {

    //搜索view
    lazy var SearchView : UIView = {
        let view = UIView()
        
        return view
    }()
    //
    lazy var goodNameBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.init(hex: "#DEDFE5")
        btn.setTitle("会员搜索", for: .normal)
        btn.setImage(UIImage.init(named: "down"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18*WidthW)
        btn.setTitleColor(UIColor.init(hex: "#3B4152"), for: .normal)
        
        return btn
    }()
    //
    lazy var SaoMaBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "扫一扫"), for: .normal)
        
        return btn
    }()
    //搜索输入框
    lazy var Textfield : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "请输入商品名称、商品码"
        textfield.font = UIFont.systemFont(ofSize: 20*WidthW)
        return textfield
    }()
    
    
    func initView()->UIView{
        
        return self
    }

}
