//
//  ZWDataReconciliationVCJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/31.
//

import UIKit

class ZWDataReconciliationVCJoe: ZWRootViewControllerJoe {
    var leftTableView : DRLeftView =  DRLeftView()
    var rightView :DRightView = DRightView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("121212")
        
        self.configUI()
        
    }
    
    func configUI(){
        self.view.addSubview(leftTableView.initView())
        leftTableView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(self.LogoImage.snp.bottom).offset(38*WidthW)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        self.view.addSubview(rightView.initView())
        rightView.snp.makeConstraints { make in
            make.left.equalTo(self.rightline.snp.right).offset(0*WidthW)
            make.top.equalTo(self.LogoImage.snp.top).offset(58*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
            
        }
        
    }

    

}
