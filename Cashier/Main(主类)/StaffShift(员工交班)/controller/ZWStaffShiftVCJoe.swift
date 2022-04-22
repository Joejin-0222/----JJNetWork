//
//  ZWStaffShiftVCJoe.swift
//  Cashier
//
//  Created by IOS FOR MAC on 2022/3/31.
//

import UIKit

class ZWStaffShiftVCJoe: ZWRootViewControllerJoe {

    var leftTableView : ZWStaffShiftLeftView =  ZWStaffShiftLeftView()
    var rightView :   ZWStaffShiftRightView = ZWStaffShiftRightView()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sehzhiUI()
        self.loadData()
    }
    
    func loadData(){
        let  dict:NSDictionary = ["shopId":Cache.userSto?.sid ?? "156207556"]
        
        ZHFNetwork.request(target: .GetYesParameters(pathStr: getCurrentDaily, parameters: dict as! [String : Any])) { result in
            
        } error1: { statusCode in
            
        } failure: { error in
            
        }
    }
    
    func sehzhiUI(){
        //
        self.view.addSubview(leftTableView.initView())
        leftTableView.snp.makeConstraints { make in
            make.left.equalTo(self.view.snp.left)
            make.top.equalTo(self.LogoImage.snp.bottom).offset(38*WidthW)
            make.width.equalTo(525*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        //
        self.view.addSubview(rightView.initView())
        rightView.snp.makeConstraints { make in
            make.left.equalTo(self.rightline.snp.right).offset(0*WidthW)
            make.top.equalTo(self.LogoImage.snp.top).offset(58*WidthW)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
            
        }
    }
  

}
