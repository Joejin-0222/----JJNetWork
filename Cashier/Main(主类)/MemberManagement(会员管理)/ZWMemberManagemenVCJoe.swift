//
//  ZWMemberManagemenVCJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/31.
//

import UIKit

class ZWMemberManagemenVCJoe: ZWRootViewControllerJoe {
  
    var leftView : ZWMemberManagemenLeftView  =  ZWMemberManagemenLeftView()
    var rightView : ZWMemberManagemenRightView  =  ZWMemberManagemenRightView()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sehzhiUI()
    }
   
    func sehzhiUI(){
        //
        self.view.addSubview(leftView.initView())
        leftView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(self.topLineView.snp.bottom)
            make.right.equalTo(self.rightline.snp.left)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        //
        
        self.view.addSubview(rightView.initView())
        rightView.snp.makeConstraints { make in
            make.left.equalTo(self.rightline.snp.right)
            make.top.equalTo(self.view.snp.top)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    override func rightLineUI() {
        //右边
        self.view.addSubview(rightline)
        rightline.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.snp.bottom)
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo((OrderTabelViewWidth+OrderRightViewWidth)*WidthW)
            make.width.equalTo(1.5*WidthW)
        }
        //顶部分割线
        self.view.addSubview(topLineView)
        topLineView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(self.LogoImage.snp.bottom).offset(28*WidthW);      make.width.equalTo((OrderTabelViewWidth+OrderRightViewWidth)*WidthW)
            make.height.equalTo(1.5*WidthW)
        }
    }
    

    

}
